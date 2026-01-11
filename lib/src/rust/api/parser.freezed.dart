// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$McapRecord {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is McapRecord);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'McapRecord()';
}


}

/// @nodoc
class $McapRecordCopyWith<$Res>  {
$McapRecordCopyWith(McapRecord _, $Res Function(McapRecord) __);
}


/// Adds pattern-matching-related methods to [McapRecord].
extension McapRecordPatterns on McapRecord {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( McapRecord_Schema value)?  schema,TResult Function( McapRecord_Channel value)?  channel,TResult Function( McapRecord_Message value)?  message,TResult Function( McapRecord_Metadata value)?  metadata,TResult Function( McapRecord_Attachment value)?  attachment,TResult Function( McapRecord_Error value)?  error,TResult Function( McapRecord_End value)?  end,required TResult orElse(),}){
final _that = this;
switch (_that) {
case McapRecord_Schema() when schema != null:
return schema(_that);case McapRecord_Channel() when channel != null:
return channel(_that);case McapRecord_Message() when message != null:
return message(_that);case McapRecord_Metadata() when metadata != null:
return metadata(_that);case McapRecord_Attachment() when attachment != null:
return attachment(_that);case McapRecord_Error() when error != null:
return error(_that);case McapRecord_End() when end != null:
return end(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( McapRecord_Schema value)  schema,required TResult Function( McapRecord_Channel value)  channel,required TResult Function( McapRecord_Message value)  message,required TResult Function( McapRecord_Metadata value)  metadata,required TResult Function( McapRecord_Attachment value)  attachment,required TResult Function( McapRecord_Error value)  error,required TResult Function( McapRecord_End value)  end,}){
final _that = this;
switch (_that) {
case McapRecord_Schema():
return schema(_that);case McapRecord_Channel():
return channel(_that);case McapRecord_Message():
return message(_that);case McapRecord_Metadata():
return metadata(_that);case McapRecord_Attachment():
return attachment(_that);case McapRecord_Error():
return error(_that);case McapRecord_End():
return end(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( McapRecord_Schema value)?  schema,TResult? Function( McapRecord_Channel value)?  channel,TResult? Function( McapRecord_Message value)?  message,TResult? Function( McapRecord_Metadata value)?  metadata,TResult? Function( McapRecord_Attachment value)?  attachment,TResult? Function( McapRecord_Error value)?  error,TResult? Function( McapRecord_End value)?  end,}){
final _that = this;
switch (_that) {
case McapRecord_Schema() when schema != null:
return schema(_that);case McapRecord_Channel() when channel != null:
return channel(_that);case McapRecord_Message() when message != null:
return message(_that);case McapRecord_Metadata() when metadata != null:
return metadata(_that);case McapRecord_Attachment() when attachment != null:
return attachment(_that);case McapRecord_Error() when error != null:
return error(_that);case McapRecord_End() when end != null:
return end(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( McapSchemaInfo field0)?  schema,TResult Function( McapChannelInfo field0)?  channel,TResult Function( McapMessage field0)?  message,TResult Function( McapMetadataInfo field0)?  metadata,TResult Function( McapAttachmentInfo field0)?  attachment,TResult Function( String field0)?  error,TResult Function()?  end,required TResult orElse(),}) {final _that = this;
switch (_that) {
case McapRecord_Schema() when schema != null:
return schema(_that.field0);case McapRecord_Channel() when channel != null:
return channel(_that.field0);case McapRecord_Message() when message != null:
return message(_that.field0);case McapRecord_Metadata() when metadata != null:
return metadata(_that.field0);case McapRecord_Attachment() when attachment != null:
return attachment(_that.field0);case McapRecord_Error() when error != null:
return error(_that.field0);case McapRecord_End() when end != null:
return end();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( McapSchemaInfo field0)  schema,required TResult Function( McapChannelInfo field0)  channel,required TResult Function( McapMessage field0)  message,required TResult Function( McapMetadataInfo field0)  metadata,required TResult Function( McapAttachmentInfo field0)  attachment,required TResult Function( String field0)  error,required TResult Function()  end,}) {final _that = this;
switch (_that) {
case McapRecord_Schema():
return schema(_that.field0);case McapRecord_Channel():
return channel(_that.field0);case McapRecord_Message():
return message(_that.field0);case McapRecord_Metadata():
return metadata(_that.field0);case McapRecord_Attachment():
return attachment(_that.field0);case McapRecord_Error():
return error(_that.field0);case McapRecord_End():
return end();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( McapSchemaInfo field0)?  schema,TResult? Function( McapChannelInfo field0)?  channel,TResult? Function( McapMessage field0)?  message,TResult? Function( McapMetadataInfo field0)?  metadata,TResult? Function( McapAttachmentInfo field0)?  attachment,TResult? Function( String field0)?  error,TResult? Function()?  end,}) {final _that = this;
switch (_that) {
case McapRecord_Schema() when schema != null:
return schema(_that.field0);case McapRecord_Channel() when channel != null:
return channel(_that.field0);case McapRecord_Message() when message != null:
return message(_that.field0);case McapRecord_Metadata() when metadata != null:
return metadata(_that.field0);case McapRecord_Attachment() when attachment != null:
return attachment(_that.field0);case McapRecord_Error() when error != null:
return error(_that.field0);case McapRecord_End() when end != null:
return end();case _:
  return null;

}
}

}

/// @nodoc


class McapRecord_Schema extends McapRecord {
  const McapRecord_Schema(this.field0): super._();
  

 final  McapSchemaInfo field0;

/// Create a copy of McapRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$McapRecord_SchemaCopyWith<McapRecord_Schema> get copyWith => _$McapRecord_SchemaCopyWithImpl<McapRecord_Schema>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is McapRecord_Schema&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'McapRecord.schema(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $McapRecord_SchemaCopyWith<$Res> implements $McapRecordCopyWith<$Res> {
  factory $McapRecord_SchemaCopyWith(McapRecord_Schema value, $Res Function(McapRecord_Schema) _then) = _$McapRecord_SchemaCopyWithImpl;
@useResult
$Res call({
 McapSchemaInfo field0
});




}
/// @nodoc
class _$McapRecord_SchemaCopyWithImpl<$Res>
    implements $McapRecord_SchemaCopyWith<$Res> {
  _$McapRecord_SchemaCopyWithImpl(this._self, this._then);

  final McapRecord_Schema _self;
  final $Res Function(McapRecord_Schema) _then;

/// Create a copy of McapRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(McapRecord_Schema(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as McapSchemaInfo,
  ));
}


}

/// @nodoc


class McapRecord_Channel extends McapRecord {
  const McapRecord_Channel(this.field0): super._();
  

 final  McapChannelInfo field0;

/// Create a copy of McapRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$McapRecord_ChannelCopyWith<McapRecord_Channel> get copyWith => _$McapRecord_ChannelCopyWithImpl<McapRecord_Channel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is McapRecord_Channel&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'McapRecord.channel(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $McapRecord_ChannelCopyWith<$Res> implements $McapRecordCopyWith<$Res> {
  factory $McapRecord_ChannelCopyWith(McapRecord_Channel value, $Res Function(McapRecord_Channel) _then) = _$McapRecord_ChannelCopyWithImpl;
@useResult
$Res call({
 McapChannelInfo field0
});




}
/// @nodoc
class _$McapRecord_ChannelCopyWithImpl<$Res>
    implements $McapRecord_ChannelCopyWith<$Res> {
  _$McapRecord_ChannelCopyWithImpl(this._self, this._then);

  final McapRecord_Channel _self;
  final $Res Function(McapRecord_Channel) _then;

/// Create a copy of McapRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(McapRecord_Channel(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as McapChannelInfo,
  ));
}


}

/// @nodoc


class McapRecord_Message extends McapRecord {
  const McapRecord_Message(this.field0): super._();
  

 final  McapMessage field0;

/// Create a copy of McapRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$McapRecord_MessageCopyWith<McapRecord_Message> get copyWith => _$McapRecord_MessageCopyWithImpl<McapRecord_Message>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is McapRecord_Message&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'McapRecord.message(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $McapRecord_MessageCopyWith<$Res> implements $McapRecordCopyWith<$Res> {
  factory $McapRecord_MessageCopyWith(McapRecord_Message value, $Res Function(McapRecord_Message) _then) = _$McapRecord_MessageCopyWithImpl;
@useResult
$Res call({
 McapMessage field0
});




}
/// @nodoc
class _$McapRecord_MessageCopyWithImpl<$Res>
    implements $McapRecord_MessageCopyWith<$Res> {
  _$McapRecord_MessageCopyWithImpl(this._self, this._then);

  final McapRecord_Message _self;
  final $Res Function(McapRecord_Message) _then;

/// Create a copy of McapRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(McapRecord_Message(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as McapMessage,
  ));
}


}

/// @nodoc


class McapRecord_Metadata extends McapRecord {
  const McapRecord_Metadata(this.field0): super._();
  

 final  McapMetadataInfo field0;

/// Create a copy of McapRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$McapRecord_MetadataCopyWith<McapRecord_Metadata> get copyWith => _$McapRecord_MetadataCopyWithImpl<McapRecord_Metadata>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is McapRecord_Metadata&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'McapRecord.metadata(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $McapRecord_MetadataCopyWith<$Res> implements $McapRecordCopyWith<$Res> {
  factory $McapRecord_MetadataCopyWith(McapRecord_Metadata value, $Res Function(McapRecord_Metadata) _then) = _$McapRecord_MetadataCopyWithImpl;
@useResult
$Res call({
 McapMetadataInfo field0
});




}
/// @nodoc
class _$McapRecord_MetadataCopyWithImpl<$Res>
    implements $McapRecord_MetadataCopyWith<$Res> {
  _$McapRecord_MetadataCopyWithImpl(this._self, this._then);

  final McapRecord_Metadata _self;
  final $Res Function(McapRecord_Metadata) _then;

/// Create a copy of McapRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(McapRecord_Metadata(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as McapMetadataInfo,
  ));
}


}

/// @nodoc


class McapRecord_Attachment extends McapRecord {
  const McapRecord_Attachment(this.field0): super._();
  

 final  McapAttachmentInfo field0;

/// Create a copy of McapRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$McapRecord_AttachmentCopyWith<McapRecord_Attachment> get copyWith => _$McapRecord_AttachmentCopyWithImpl<McapRecord_Attachment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is McapRecord_Attachment&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'McapRecord.attachment(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $McapRecord_AttachmentCopyWith<$Res> implements $McapRecordCopyWith<$Res> {
  factory $McapRecord_AttachmentCopyWith(McapRecord_Attachment value, $Res Function(McapRecord_Attachment) _then) = _$McapRecord_AttachmentCopyWithImpl;
@useResult
$Res call({
 McapAttachmentInfo field0
});




}
/// @nodoc
class _$McapRecord_AttachmentCopyWithImpl<$Res>
    implements $McapRecord_AttachmentCopyWith<$Res> {
  _$McapRecord_AttachmentCopyWithImpl(this._self, this._then);

  final McapRecord_Attachment _self;
  final $Res Function(McapRecord_Attachment) _then;

/// Create a copy of McapRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(McapRecord_Attachment(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as McapAttachmentInfo,
  ));
}


}

/// @nodoc


class McapRecord_Error extends McapRecord {
  const McapRecord_Error(this.field0): super._();
  

 final  String field0;

/// Create a copy of McapRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$McapRecord_ErrorCopyWith<McapRecord_Error> get copyWith => _$McapRecord_ErrorCopyWithImpl<McapRecord_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is McapRecord_Error&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'McapRecord.error(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $McapRecord_ErrorCopyWith<$Res> implements $McapRecordCopyWith<$Res> {
  factory $McapRecord_ErrorCopyWith(McapRecord_Error value, $Res Function(McapRecord_Error) _then) = _$McapRecord_ErrorCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$McapRecord_ErrorCopyWithImpl<$Res>
    implements $McapRecord_ErrorCopyWith<$Res> {
  _$McapRecord_ErrorCopyWithImpl(this._self, this._then);

  final McapRecord_Error _self;
  final $Res Function(McapRecord_Error) _then;

/// Create a copy of McapRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(McapRecord_Error(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class McapRecord_End extends McapRecord {
  const McapRecord_End(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is McapRecord_End);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'McapRecord.end()';
}


}




// dart format on
