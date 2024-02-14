import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

class Base64StringConverter implements JsonConverter<Uint8List, String> {
  const Base64StringConverter();

  @override
  Uint8List fromJson(source) => base64Decode(source);

  @override
  toJson(Uint8List bytes) => base64Encode(bytes);
}