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
  GoBackState get goBackState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoneyMeterPageStateCopyWith<MoneyMeterPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoneyMeterPageStateCopyWith<$Res> {
  factory $MoneyMeterPageStateCopyWith(
          MoneyMeterPageState value, $Res Function(MoneyMeterPageState) then) =
      _$MoneyMeterPageStateCopyWithImpl<$Res>;
  $Res call({MoneyMeterModel moneyMeterModel, GoBackState goBackState});

  $MoneyMeterModelCopyWith<$Res> get moneyMeterModel;
  $GoBackStateCopyWith<$Res> get goBackState;
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
    Object? goBackState = freezed,
  }) {
    return _then(_value.copyWith(
      moneyMeterModel: moneyMeterModel == freezed
          ? _value.moneyMeterModel
          : moneyMeterModel // ignore: cast_nullable_to_non_nullable
              as MoneyMeterModel,
      goBackState: goBackState == freezed
          ? _value.goBackState
          : goBackState // ignore: cast_nullable_to_non_nullable
              as GoBackState,
    ));
  }

  @override
  $MoneyMeterModelCopyWith<$Res> get moneyMeterModel {
    return $MoneyMeterModelCopyWith<$Res>(_value.moneyMeterModel, (value) {
      return _then(_value.copyWith(moneyMeterModel: value));
    });
  }

  @override
  $GoBackStateCopyWith<$Res> get goBackState {
    return $GoBackStateCopyWith<$Res>(_value.goBackState, (value) {
      return _then(_value.copyWith(goBackState: value));
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
  $Res call({MoneyMeterModel moneyMeterModel, GoBackState goBackState});

  @override
  $MoneyMeterModelCopyWith<$Res> get moneyMeterModel;
  @override
  $GoBackStateCopyWith<$Res> get goBackState;
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
    Object? goBackState = freezed,
  }) {
    return _then(_$_MoneyMeterPageState(
      moneyMeterModel: moneyMeterModel == freezed
          ? _value.moneyMeterModel
          : moneyMeterModel // ignore: cast_nullable_to_non_nullable
              as MoneyMeterModel,
      goBackState: goBackState == freezed
          ? _value.goBackState
          : goBackState // ignore: cast_nullable_to_non_nullable
              as GoBackState,
    ));
  }
}

/// @nodoc

class _$_MoneyMeterPageState implements _MoneyMeterPageState {
  _$_MoneyMeterPageState(
      {this.moneyMeterModel = const MoneyMeterModel(),
      this.goBackState = const GoBackState()});

  @override
  @JsonKey()
  final MoneyMeterModel moneyMeterModel;
  @override
  @JsonKey()
  final GoBackState goBackState;

  @override
  String toString() {
    return 'MoneyMeterPageState(moneyMeterModel: $moneyMeterModel, goBackState: $goBackState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoneyMeterPageState &&
            const DeepCollectionEquality()
                .equals(other.moneyMeterModel, moneyMeterModel) &&
            const DeepCollectionEquality()
                .equals(other.goBackState, goBackState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(moneyMeterModel),
      const DeepCollectionEquality().hash(goBackState));

  @JsonKey(ignore: true)
  @override
  _$$_MoneyMeterPageStateCopyWith<_$_MoneyMeterPageState> get copyWith =>
      __$$_MoneyMeterPageStateCopyWithImpl<_$_MoneyMeterPageState>(
          this, _$identity);
}

abstract class _MoneyMeterPageState implements MoneyMeterPageState {
  factory _MoneyMeterPageState(
      {final MoneyMeterModel moneyMeterModel,
      final GoBackState goBackState}) = _$_MoneyMeterPageState;

  @override
  MoneyMeterModel get moneyMeterModel;
  @override
  GoBackState get goBackState;
  @override
  @JsonKey(ignore: true)
  _$$_MoneyMeterPageStateCopyWith<_$_MoneyMeterPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
