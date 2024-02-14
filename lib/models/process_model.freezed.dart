// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'process_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProcessModel _$ProcessModelFromJson(Map<String, dynamic> json) {
  return _ProcessModel.fromJson(json);
}

/// @nodoc
mixin _$ProcessModel {
  String get name => throw _privateConstructorUsedError;
  @Base64StringConverter()
  Uint8List get icon => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessModelCopyWith<ProcessModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessModelCopyWith<$Res> {
  factory $ProcessModelCopyWith(
          ProcessModel value, $Res Function(ProcessModel) then) =
      _$ProcessModelCopyWithImpl<$Res, ProcessModel>;
  @useResult
  $Res call(
      {String name, @Base64StringConverter() Uint8List icon, int duration});
}

/// @nodoc
class _$ProcessModelCopyWithImpl<$Res, $Val extends ProcessModel>
    implements $ProcessModelCopyWith<$Res> {
  _$ProcessModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessModelImplCopyWith<$Res>
    implements $ProcessModelCopyWith<$Res> {
  factory _$$ProcessModelImplCopyWith(
          _$ProcessModelImpl value, $Res Function(_$ProcessModelImpl) then) =
      __$$ProcessModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, @Base64StringConverter() Uint8List icon, int duration});
}

/// @nodoc
class __$$ProcessModelImplCopyWithImpl<$Res>
    extends _$ProcessModelCopyWithImpl<$Res, _$ProcessModelImpl>
    implements _$$ProcessModelImplCopyWith<$Res> {
  __$$ProcessModelImplCopyWithImpl(
      _$ProcessModelImpl _value, $Res Function(_$ProcessModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? duration = null,
  }) {
    return _then(_$ProcessModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessModelImpl implements _ProcessModel {
  _$ProcessModelImpl(
      {required this.name,
      @Base64StringConverter() required this.icon,
      required this.duration});

  factory _$ProcessModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessModelImplFromJson(json);

  @override
  final String name;
  @override
  @Base64StringConverter()
  final Uint8List icon;
  @override
  final int duration;

  @override
  String toString() {
    return 'ProcessModel(name: $name, icon: $icon, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(icon), duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessModelImplCopyWith<_$ProcessModelImpl> get copyWith =>
      __$$ProcessModelImplCopyWithImpl<_$ProcessModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessModelImplToJson(
      this,
    );
  }
}

abstract class _ProcessModel implements ProcessModel {
  factory _ProcessModel(
      {required final String name,
      @Base64StringConverter() required final Uint8List icon,
      required final int duration}) = _$ProcessModelImpl;

  factory _ProcessModel.fromJson(Map<String, dynamic> json) =
      _$ProcessModelImpl.fromJson;

  @override
  String get name;
  @override
  @Base64StringConverter()
  Uint8List get icon;
  @override
  int get duration;
  @override
  @JsonKey(ignore: true)
  _$$ProcessModelImplCopyWith<_$ProcessModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
