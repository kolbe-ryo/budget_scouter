// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'analysis_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnalysisPageState {
  MoneyConsumptionHistoryModel get currentExpentiture =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnalysisPageStateCopyWith<AnalysisPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisPageStateCopyWith<$Res> {
  factory $AnalysisPageStateCopyWith(
          AnalysisPageState value, $Res Function(AnalysisPageState) then) =
      _$AnalysisPageStateCopyWithImpl<$Res>;
  $Res call({MoneyConsumptionHistoryModel currentExpentiture});

  $MoneyConsumptionHistoryModelCopyWith<$Res> get currentExpentiture;
}

/// @nodoc
class _$AnalysisPageStateCopyWithImpl<$Res>
    implements $AnalysisPageStateCopyWith<$Res> {
  _$AnalysisPageStateCopyWithImpl(this._value, this._then);

  final AnalysisPageState _value;
  // ignore: unused_field
  final $Res Function(AnalysisPageState) _then;

  @override
  $Res call({
    Object? currentExpentiture = freezed,
  }) {
    return _then(_value.copyWith(
      currentExpentiture: currentExpentiture == freezed
          ? _value.currentExpentiture
          : currentExpentiture // ignore: cast_nullable_to_non_nullable
              as MoneyConsumptionHistoryModel,
    ));
  }

  @override
  $MoneyConsumptionHistoryModelCopyWith<$Res> get currentExpentiture {
    return $MoneyConsumptionHistoryModelCopyWith<$Res>(
        _value.currentExpentiture, (value) {
      return _then(_value.copyWith(currentExpentiture: value));
    });
  }
}

/// @nodoc
abstract class _$$_AnalysisPageStateCopyWith<$Res>
    implements $AnalysisPageStateCopyWith<$Res> {
  factory _$$_AnalysisPageStateCopyWith(_$_AnalysisPageState value,
          $Res Function(_$_AnalysisPageState) then) =
      __$$_AnalysisPageStateCopyWithImpl<$Res>;
  @override
  $Res call({MoneyConsumptionHistoryModel currentExpentiture});

  @override
  $MoneyConsumptionHistoryModelCopyWith<$Res> get currentExpentiture;
}

/// @nodoc
class __$$_AnalysisPageStateCopyWithImpl<$Res>
    extends _$AnalysisPageStateCopyWithImpl<$Res>
    implements _$$_AnalysisPageStateCopyWith<$Res> {
  __$$_AnalysisPageStateCopyWithImpl(
      _$_AnalysisPageState _value, $Res Function(_$_AnalysisPageState) _then)
      : super(_value, (v) => _then(v as _$_AnalysisPageState));

  @override
  _$_AnalysisPageState get _value => super._value as _$_AnalysisPageState;

  @override
  $Res call({
    Object? currentExpentiture = freezed,
  }) {
    return _then(_$_AnalysisPageState(
      currentExpentiture: currentExpentiture == freezed
          ? _value.currentExpentiture
          : currentExpentiture // ignore: cast_nullable_to_non_nullable
              as MoneyConsumptionHistoryModel,
    ));
  }
}

/// @nodoc

class _$_AnalysisPageState implements _AnalysisPageState {
  _$_AnalysisPageState(
      {this.currentExpentiture = const MoneyConsumptionHistoryModel()});

  @override
  @JsonKey()
  final MoneyConsumptionHistoryModel currentExpentiture;

  @override
  String toString() {
    return 'AnalysisPageState(currentExpentiture: $currentExpentiture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnalysisPageState &&
            const DeepCollectionEquality()
                .equals(other.currentExpentiture, currentExpentiture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentExpentiture));

  @JsonKey(ignore: true)
  @override
  _$$_AnalysisPageStateCopyWith<_$_AnalysisPageState> get copyWith =>
      __$$_AnalysisPageStateCopyWithImpl<_$_AnalysisPageState>(
          this, _$identity);
}

abstract class _AnalysisPageState implements AnalysisPageState {
  factory _AnalysisPageState(
          {final MoneyConsumptionHistoryModel currentExpentiture}) =
      _$_AnalysisPageState;

  @override
  MoneyConsumptionHistoryModel get currentExpentiture;
  @override
  @JsonKey(ignore: true)
  _$$_AnalysisPageStateCopyWith<_$_AnalysisPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
