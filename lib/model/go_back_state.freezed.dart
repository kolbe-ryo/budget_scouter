// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'go_back_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoBackState {
  bool get canBack => throw _privateConstructorUsedError;
  bool get canGo => throw _privateConstructorUsedError;
  int get previousValue => throw _privateConstructorUsedError;
  int get forwardValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoBackStateCopyWith<GoBackState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoBackStateCopyWith<$Res> {
  factory $GoBackStateCopyWith(
          GoBackState value, $Res Function(GoBackState) then) =
      _$GoBackStateCopyWithImpl<$Res>;
  $Res call({bool canBack, bool canGo, int previousValue, int forwardValue});
}

/// @nodoc
class _$GoBackStateCopyWithImpl<$Res> implements $GoBackStateCopyWith<$Res> {
  _$GoBackStateCopyWithImpl(this._value, this._then);

  final GoBackState _value;
  // ignore: unused_field
  final $Res Function(GoBackState) _then;

  @override
  $Res call({
    Object? canBack = freezed,
    Object? canGo = freezed,
    Object? previousValue = freezed,
    Object? forwardValue = freezed,
  }) {
    return _then(_value.copyWith(
      canBack: canBack == freezed
          ? _value.canBack
          : canBack // ignore: cast_nullable_to_non_nullable
              as bool,
      canGo: canGo == freezed
          ? _value.canGo
          : canGo // ignore: cast_nullable_to_non_nullable
              as bool,
      previousValue: previousValue == freezed
          ? _value.previousValue
          : previousValue // ignore: cast_nullable_to_non_nullable
              as int,
      forwardValue: forwardValue == freezed
          ? _value.forwardValue
          : forwardValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_GoBackStateCopyWith<$Res>
    implements $GoBackStateCopyWith<$Res> {
  factory _$$_GoBackStateCopyWith(
          _$_GoBackState value, $Res Function(_$_GoBackState) then) =
      __$$_GoBackStateCopyWithImpl<$Res>;
  @override
  $Res call({bool canBack, bool canGo, int previousValue, int forwardValue});
}

/// @nodoc
class __$$_GoBackStateCopyWithImpl<$Res> extends _$GoBackStateCopyWithImpl<$Res>
    implements _$$_GoBackStateCopyWith<$Res> {
  __$$_GoBackStateCopyWithImpl(
      _$_GoBackState _value, $Res Function(_$_GoBackState) _then)
      : super(_value, (v) => _then(v as _$_GoBackState));

  @override
  _$_GoBackState get _value => super._value as _$_GoBackState;

  @override
  $Res call({
    Object? canBack = freezed,
    Object? canGo = freezed,
    Object? previousValue = freezed,
    Object? forwardValue = freezed,
  }) {
    return _then(_$_GoBackState(
      canBack: canBack == freezed
          ? _value.canBack
          : canBack // ignore: cast_nullable_to_non_nullable
              as bool,
      canGo: canGo == freezed
          ? _value.canGo
          : canGo // ignore: cast_nullable_to_non_nullable
              as bool,
      previousValue: previousValue == freezed
          ? _value.previousValue
          : previousValue // ignore: cast_nullable_to_non_nullable
              as int,
      forwardValue: forwardValue == freezed
          ? _value.forwardValue
          : forwardValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GoBackState implements _GoBackState {
  const _$_GoBackState(
      {this.canBack = false,
      this.canGo = false,
      this.previousValue = 0,
      this.forwardValue = 0});

  @override
  @JsonKey()
  final bool canBack;
  @override
  @JsonKey()
  final bool canGo;
  @override
  @JsonKey()
  final int previousValue;
  @override
  @JsonKey()
  final int forwardValue;

  @override
  String toString() {
    return 'GoBackState(canBack: $canBack, canGo: $canGo, previousValue: $previousValue, forwardValue: $forwardValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoBackState &&
            const DeepCollectionEquality().equals(other.canBack, canBack) &&
            const DeepCollectionEquality().equals(other.canGo, canGo) &&
            const DeepCollectionEquality()
                .equals(other.previousValue, previousValue) &&
            const DeepCollectionEquality()
                .equals(other.forwardValue, forwardValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(canBack),
      const DeepCollectionEquality().hash(canGo),
      const DeepCollectionEquality().hash(previousValue),
      const DeepCollectionEquality().hash(forwardValue));

  @JsonKey(ignore: true)
  @override
  _$$_GoBackStateCopyWith<_$_GoBackState> get copyWith =>
      __$$_GoBackStateCopyWithImpl<_$_GoBackState>(this, _$identity);
}

abstract class _GoBackState implements GoBackState {
  const factory _GoBackState(
      {final bool canBack,
      final bool canGo,
      final int previousValue,
      final int forwardValue}) = _$_GoBackState;

  @override
  bool get canBack;
  @override
  bool get canGo;
  @override
  int get previousValue;
  @override
  int get forwardValue;
  @override
  @JsonKey(ignore: true)
  _$$_GoBackStateCopyWith<_$_GoBackState> get copyWith =>
      throw _privateConstructorUsedError;
}
