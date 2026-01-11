#!/usr/bin/env bash

dart run build_runner build

flutter_rust_bridge_codegen generate

cd example
flutter run -d linux -vv
