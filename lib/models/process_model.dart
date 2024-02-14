import 'dart:typed_data';
import 'package:echse_frontend/utils/tools/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'process_model.freezed.dart';

part 'process_model.g.dart';

@freezed
class ProcessModel with _$ProcessModel {
  factory ProcessModel({required String name,@Base64StringConverter() required Uint8List icon, required int duration}) = _ProcessModel;

  factory ProcessModel.fromJson(Map<String, dynamic> json) => _$ProcessModelFromJson(json);
}
