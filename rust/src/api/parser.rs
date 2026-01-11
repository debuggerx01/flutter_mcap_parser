use mcap;
use mcap::records::Record;
use memmap::Mmap;
use std::collections::HashMap;
use std::fs::File;
use chrono::{DateTime, Utc};
use anyhow;

use crate::frb_generated::StreamSink;

pub struct McapSchemaInfo {
    pub id: u16,
    pub name: String,
    pub encoding: String,
    pub data: Vec<u8>,
}

pub struct McapChannelInfo {
    pub id: u16,
    pub topic: String,
    pub message_encoding: String,
    pub schema_id: u16,
    pub metadata: HashMap<String, String>,
}

pub struct McapMetadataInfo {
    pub name: String,
    pub metadata: HashMap<String, String>,
}

pub struct McapAttachmentInfo {
    pub log_time: DateTime<Utc>,
    pub create_time: DateTime<Utc>,
    pub name: String,
    pub media_type: String,
    pub crc: u32,
    pub data: Vec<u8>,
}

pub struct McapMessage {
    pub channel_id: u16,
    pub log_time: DateTime<Utc>,
    pub publish_time: DateTime<Utc>,
    pub data: Vec<u8>,
}

#[derive(PartialEq)]
pub enum RecordType {
    Metadata,
    Channel,
    Schema,
    Attachment,
    Message,
    End,
}

pub enum McapRecord {
    Schema(McapSchemaInfo),
    Channel(McapChannelInfo),
    Message(McapMessage),
    Metadata(McapMetadataInfo),
    Attachment(McapAttachmentInfo),
    Error(String),
    End,
}

fn ns_to_datetime(ns: u64) -> DateTime<Utc> {
    let secs = (ns / 1_000_000_000) as i64;
    let nsecs = (ns % 1_000_000_000) as u32;
    DateTime::from_timestamp(secs, nsecs).unwrap_or_default()
}

pub fn parse_mcap(path: String, buf: Vec<u8>, types: Vec<RecordType>, sink: StreamSink<McapRecord>) {
    let need_schema = types.contains(&RecordType::Schema);
    let need_channel = types.contains(&RecordType::Channel);
    let need_metadata = types.contains(&RecordType::Metadata);
    let need_attachment = types.contains(&RecordType::Attachment);
    let need_message = types.contains(&RecordType::Message);

    let _mapped_guard: Option<Mmap>;
    let data_slice: &[u8];

    let setup_result = (|| -> anyhow::Result<&[u8]> {
        if !path.is_empty() {
            let file = File::open(&path)?;
            let _mapped = unsafe { Mmap::map(&file)? };
            Ok(&[])
        } else {
            Ok(&buf)
        }
    })();

    if setup_result.is_err() {
        sink.add(McapRecord::Error(format!("IO Error: {}", setup_result.err().unwrap())));
        return;
    }

    if !path.is_empty() {
        match File::open(&path) {
            Ok(f) => match unsafe { Mmap::map(&f) } {
                Ok(m) => {
                    _mapped_guard = Some(m);
                    data_slice = _mapped_guard.as_ref().unwrap();
                }
                Err(e) => {
                    sink.add(McapRecord::Error(format!("Mmap failed: {}", e)));
                    return;
                }
            },
            Err(e) => {
                sink.add(McapRecord::Error(format!("Open failed: {}", e)));
                return;
            }
        }
    } else {
        _mapped_guard = None;
        data_slice = &buf;
    }

    let need_structure_scan = need_schema || need_channel || need_metadata || need_attachment;

    if need_structure_scan {
        match mcap::read::LinearReader::new(data_slice) {
            Ok(reader) => {
                for record in reader {
                    if let Ok(record) = record {
                        match record {
                            Record::Schema { header, data } if need_schema => {
                                sink.add(McapRecord::Schema(McapSchemaInfo {
                                    id: header.id,
                                    name: header.name,
                                    encoding: header.encoding,
                                    data: data.to_vec(),
                                }));
                            }
                            Record::Channel(c) if need_channel => {
                                sink.add(McapRecord::Channel(McapChannelInfo {
                                    id: c.id,
                                    topic: c.topic,
                                    message_encoding: c.message_encoding,
                                    schema_id: c.schema_id,
                                    metadata: c.metadata.into_iter().collect(),
                                }));
                            }
                            Record::Metadata(m) if need_metadata => {
                                sink.add(McapRecord::Metadata(McapMetadataInfo {
                                    name: m.name,
                                    metadata: m.metadata.into_iter().collect(),
                                }));
                            }
                            Record::Attachment { header, data, crc } if need_attachment => {
                                sink.add(McapRecord::Attachment(McapAttachmentInfo {
                                    log_time: ns_to_datetime(header.log_time),
                                    create_time: ns_to_datetime(header.create_time),
                                    name: header.name,
                                    media_type: header.media_type,
                                    crc,
                                    data: data.to_vec(),
                                }));
                            }
                            _ => {}
                        }
                    }
                }
            }
            Err(e) => {
                sink.add(McapRecord::Error(format!("Structure parse error: {}", e)));
            }
        }
    }
    if need_message {
        match mcap::read::MessageStream::new(data_slice) {
            Ok(stream) => {
                for message in stream {
                    match message {
                        Ok(m) => {
                            sink.add(McapRecord::Message(McapMessage {
                                channel_id: m.channel.id,
                                log_time: ns_to_datetime(m.log_time),
                                publish_time: ns_to_datetime(m.publish_time),
                                data: m.data.to_vec(),
                            }));
                        }
                        Err(e) => {
                            sink.add(McapRecord::Error(format!("Msg error: {}", e)));
                        }
                    }
                }
            }
            Err(e) => {
                sink.add(McapRecord::Error(format!("Message stream init error: {}", e)));
            }
        }
    }

    sink.add(McapRecord::End);
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

