// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'money_consumption_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoneyConsumptionHistoryModel _$MoneyConsumptionHistoryModelFromJson(
    Map<String, dynamic> json) {
  return _MoneyConsumptionHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$MoneyConsumptionHistoryModel {
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get initBalance => throw _privateConstructorUsedError;
  int get remainedBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoneyConsumptionHistoryModelCopyWith<MoneyConsumptionHistoryModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoneyConsumptionHistoryModelCopyWith<$Res> {
  factory $MoneyConsumptionHistoryModelCopyWith(
          MoneyConsumptionHistoryModel value,
          $Res Function(MoneyConsumptionHistoryModel) then) =
      _$MoneyConsumptionHistoryModelCopyWithImpl<$Res>;
  $Res call({int year, int month, int initBalance, int remainedBalance});
}

/// @nodoc
class _$MoneyConsumptionHistoryModelCopyWithImpl<$Res>
    implements $MoneyConsumptionHistoryModelCopyWith<$Res> {
  _$MoneyConsumptionHistoryModelCopyWithImpl(this._value, this._then);

  final MoneyConsumptionHistoryModel _value;
  // ignore: unused_field
  final $Res Function(MoneyConsumptionHistoryModel) _then;

  @override
  $Res call({
    Object? year = freezed,
    Object? month = freezed,
    Object? initBalance = freezed,
    Object? remainedBalance = freezed,
  }) {
    return _then(_value.copyWith(
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      initBalance: initBalance == freezed
          ? _value.initBalance
          : initBalance // ignore: cast_nullable_to_non_nullable
              as int,
      remainedBalance: remainedBalance == freezed
          ? _value.remainedBalance
          : remainedBalance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_MoneyConsumptionHistoryModelCopyWith<$Res>
    implements $MoneyConsumptionHistoryModelCopyWith<$Res> {
  factory _$$_MoneyConsumptionHistoryModelCopyWith(
          _$_MoneyConsumptionHistoryModel value,
          $Res Function(_$_MoneyConsumptionHistoryModel) then) =
      __$$_MoneyConsumptionHistoryModelCopyWithImpl<$Res>;
  @override
  $Res call({int year, int month, int initBalance, int remainedBalance});
}

/// @nodoc
class __$$_MoneyConsumptionHistoryModelCopyWithImpl<$Res>
    extends _$MoneyConsumptionHistoryModelCopyWithImpl<$Res>
    implements _$$_MoneyConsumptionHistoryModelCopyWith<$Res> {
  __$$_MoneyConsumptionHistoryModelCopyWithImpl(
      _$_MoneyConsumptionHistoryModel _value,
      $Res Function(_$_MoneyConsumptionHistoryModel) _then)
      : super(_value, (v) => _then(v as _$_MoneyConsumptionHistoryModel));

  @override
  _$_MoneyConsumptionHistoryModel get _value =>
      super._value as _$_MoneyConsumptionHistoryModel;

  @override
  $Res call({
    Object? year = freezed,
    Object? month = freezed,
    Object? initBalance = freezed,
    Object? remainedBalance = freezed,
  }) {
    return _then(_$_MoneyConsumptionHistoryModel(
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      initBalance: initBalance == freezed
          ? _value.initBalance
          : initBalance // ignore: cast_nullable_to_non_nullable
              as int,
      remainedBalance: remainedBalance == freezed
          ? _value.remainedBalance
          : remainedBalance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MoneyConsumptionHistoryModel extends _MoneyConsumptionHistoryModel {
  const _$_MoneyConsumptionHistoryModel(
      {this.year = 0,
      this.month = 0,
      this.initBalance = 0,
      this.remainedBalance = 0})
      : super._();

  factory _$_MoneyConsumptionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_MoneyConsumptionHistoryModelFromJson(json);

  @override
  @JsonKey()
  final int year;
  @override
  @JsonKey()
  final int month;
  @override
  @JsonKey()
  final int initBalance;
  @override
  @JsonKey()
  final int remainedBalance;

  @override
  String toString() {
    return 'MoneyConsumptionHistoryModel(year: $year, month: $month, initBalance: $initBalance, remainedBalance: $remainedBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoneyConsumptionHistoryModel &&
            const DeepCollectionEquality().equals(other.year, year) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality()
                .equals(other.initBalance, initBalance) &&
            const DeepCollectionEquality()
                .equals(other.remainedBalance, remainedBalance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(year),
      const DeepCollectionEquality().hash(month),
      const DeepCollectionEquality().hash(initBalance),
      const DeepCollectionEquality().hash(remainedBalance));

  @JsonKey(ignore: true)
  @override
  _$$_MoneyConsumptionHistoryModelCopyWith<_$_MoneyConsumptionHistoryModel>
      get copyWith => __$$_MoneyConsumptionHistoryModelCopyWithImpl<
          _$_MoneyConsumptionHistoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MoneyConsumptionHistoryModelToJson(this);
  }
}

abstract class _MoneyConsumptionHistoryModel
    extends MoneyConsumptionHistoryModel {
  const factory _MoneyConsumptionHistoryModel(
      {final int year,
      final int month,
      final int initBalance,
      final int remainedBalance}) = _$_MoneyConsumptionHistoryModel;
  const _MoneyConsumptionHistoryModel._() : super._();

  factory _MoneyConsumptionHistoryModel.fromJson(Map<String, dynamic> json) =
      _$_MoneyConsumptionHistoryModel.fromJson;

  @override
  int get year;
  @override
  int get month;
  @override
  int get initBalance;
  @override
  int get remainedBalance;
  @override
  @JsonKey(ignore: true)
  _$$_MoneyConsumptionHistoryModelCopyWith<_$_MoneyConsumptionHistoryModel>
      get copyWith => throw _privateConstructorUsedError;
}
