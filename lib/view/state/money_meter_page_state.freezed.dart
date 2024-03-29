// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'money_meter_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoneyMeterPageState {
  MoneyMeterModel get moneyMeterModel => throw _privateConstructorUsedError;
  int get tempInput => throw _privateConstructorUsedError;
  bool get canBack => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoneyMeterPageStateCopyWith<MoneyMeterPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoneyMeterPageStateCopyWith<$Res> {
  factory $MoneyMeterPageStateCopyWith(
          MoneyMeterPageState value, $Res Function(MoneyMeterPageState) then) =
      _$MoneyMeterPageStateCopyWithImpl<$Res>;
  $Res call({MoneyMeterModel moneyMeterModel, int tempInput, bool canBack});

  $MoneyMeterModelCopyWith<$Res> get moneyMeterModel;
}

/// @nodoc
class _$MoneyMeterPageStateCopyWithImpl<$Res>
    implements $MoneyMeterPageStateCopyWith<$Res> {
  _$MoneyMeterPageStateCopyWithImpl(this._value, this._then);

  final MoneyMeterPageState _value;
  // ignore: unused_field
  final $Res Function(MoneyMeterPageState) _then;

  @override
  $Res call({
    Object? moneyMeterModel = freezed,
    Object? tempInput = freezed,
    Object? canBack = freezed,
  }) {
    return _then(_value.copyWith(
      moneyMeterModel: moneyMeterModel == freezed
          ? _value.moneyMeterModel
          : moneyMeterModel // ignore: cast_nullable_to_non_nullable
              as MoneyMeterModel,
      tempInput: tempInput == freezed
          ? _value.tempInput
          : tempInput // ignore: cast_nullable_to_non_nullable
              as int,
      canBack: canBack == freezed
          ? _value.canBack
          : canBack // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $MoneyMeterModelCopyWith<$Res> get moneyMeterModel {
    return $MoneyMeterModelCopyWith<$Res>(_value.moneyMeterModel, (value) {
      return _then(_value.copyWith(moneyMeterModel: value));
    });
  }
}

/// @nodoc
abstract class _$$_MoneyMeterPageStateCopyWith<$Res>
    implements $MoneyMeterPageStateCopyWith<$Res> {
  factory _$$_MoneyMeterPageStateCopyWith(_$_MoneyMeterPageState value,
          $Res Function(_$_MoneyMeterPageState) then) =
      __$$_MoneyMeterPageStateCopyWithImpl<$Res>;
  @override
  $Res call({MoneyMeterModel moneyMeterModel, int tempInput, bool canBack});

  @override
  $MoneyMeterModelCopyWith<$Res> get moneyMeterModel;
}

/// @nodoc
class __$$_MoneyMeterPageStateCopyWithImpl<$Res>
    extends _$MoneyMeterPageStateCopyWithImpl<$Res>
    implements _$$_MoneyMeterPageStateCopyWith<$Res> {
  __$$_MoneyMeterPageStateCopyWithImpl(_$_MoneyMeterPageState _value,
      $Res Function(_$_MoneyMeterPageState) _then)
      : super(_value, (v) => _then(v as _$_MoneyMeterPageState));

  @override
  _$_MoneyMeterPageState get _value => super._value as _$_MoneyMeterPageState;

  @override
  $Res call({
    Object? moneyMeterModel = freezed,
    Object? tempInput = freezed,
    Object? canBack = freezed,
  }) {
    return _then(_$_MoneyMeterPageState(
      moneyMeterModel: moneyMeterModel == freezed
          ? _value.moneyMeterModel
          : moneyMeterModel // ignore: cast_nullable_to_non_nullable
              as MoneyMeterModel,
      tempInput: tempInput == freezed
          ? _value.tempInput
          : tempInput // ignore: cast_nullable_to_non_nullable
              as int,
      canBack: canBack == freezed
          ? _value.canBack
          : canBack // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MoneyMeterPageState implements _MoneyMeterPageState {
  _$_MoneyMeterPageState(
      {this.moneyMeterModel = const MoneyMeterModel(),
      this.tempInput = 0,
      this.canBack = false});

  @override
  @JsonKey()
  final MoneyMeterModel moneyMeterModel;
  @override
  @JsonKey()
  final int tempInput;
  @override
  @JsonKey()
  final bool canBack;

  @override
  String toString() {
    return 'MoneyMeterPageState(moneyMeterModel: $moneyMeterModel, tempInput: $tempInput, canBack: $canBack)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoneyMeterPageState &&
            const DeepCollectionEquality()
                .equals(other.moneyMeterModel, moneyMeterModel) &&
            const DeepCollectionEquality().equals(other.tempInput, tempInput) &&
            const DeepCollectionEquality().equals(other.canBack, canBack));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(moneyMeterModel),
      const DeepCollectionEquality().hash(tempInput),
      const DeepCollectionEquality().hash(canBack));

  @JsonKey(ignore: true)
  @override
  _$$_MoneyMeterPageStateCopyWith<_$_MoneyMeterPageState> get copyWith =>
      __$$_MoneyMeterPageStateCopyWithImpl<_$_MoneyMeterPageState>(
          this, _$identity);
}

abstract class _MoneyMeterPageState implements MoneyMeterPageState {
  factory _MoneyMeterPageState(
      {final MoneyMeterModel moneyMeterModel,
      final int tempInput,
      final bool canBack}) = _$_MoneyMeterPageState;

  @override
  MoneyMeterModel get moneyMeterModel;
  @override
  int get tempInput;
  @override
  bool get canBack;
  @override
  @JsonKey(ignore: true)
  _$$_MoneyMeterPageStateCopyWith<_$_MoneyMeterPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
