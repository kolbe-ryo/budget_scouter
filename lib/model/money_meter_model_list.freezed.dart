// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'money_meter_model_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoneyMeterModelList _$MoneyMeterModelListFromJson(Map<String, dynamic> json) {
  return _MoneyMeterModelList.fromJson(json);
}

/// @nodoc
mixin _$MoneyMeterModelList {
  List<MoneyMeterModel> get moneyMeterModelList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoneyMeterModelListCopyWith<MoneyMeterModelList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoneyMeterModelListCopyWith<$Res> {
  factory $MoneyMeterModelListCopyWith(
          MoneyMeterModelList value, $Res Function(MoneyMeterModelList) then) =
      _$MoneyMeterModelListCopyWithImpl<$Res>;
  $Res call({List<MoneyMeterModel> moneyMeterModelList});
}

/// @nodoc
class _$MoneyMeterModelListCopyWithImpl<$Res>
    implements $MoneyMeterModelListCopyWith<$Res> {
  _$MoneyMeterModelListCopyWithImpl(this._value, this._then);

  final MoneyMeterModelList _value;
  // ignore: unused_field
  final $Res Function(MoneyMeterModelList) _then;

  @override
  $Res call({
    Object? moneyMeterModelList = freezed,
  }) {
    return _then(_value.copyWith(
      moneyMeterModelList: moneyMeterModelList == freezed
          ? _value.moneyMeterModelList
          : moneyMeterModelList // ignore: cast_nullable_to_non_nullable
              as List<MoneyMeterModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_MoneyMeterModelListCopyWith<$Res>
    implements $MoneyMeterModelListCopyWith<$Res> {
  factory _$$_MoneyMeterModelListCopyWith(_$_MoneyMeterModelList value,
          $Res Function(_$_MoneyMeterModelList) then) =
      __$$_MoneyMeterModelListCopyWithImpl<$Res>;
  @override
  $Res call({List<MoneyMeterModel> moneyMeterModelList});
}

/// @nodoc
class __$$_MoneyMeterModelListCopyWithImpl<$Res>
    extends _$MoneyMeterModelListCopyWithImpl<$Res>
    implements _$$_MoneyMeterModelListCopyWith<$Res> {
  __$$_MoneyMeterModelListCopyWithImpl(_$_MoneyMeterModelList _value,
      $Res Function(_$_MoneyMeterModelList) _then)
      : super(_value, (v) => _then(v as _$_MoneyMeterModelList));

  @override
  _$_MoneyMeterModelList get _value => super._value as _$_MoneyMeterModelList;

  @override
  $Res call({
    Object? moneyMeterModelList = freezed,
  }) {
    return _then(_$_MoneyMeterModelList(
      moneyMeterModelList: moneyMeterModelList == freezed
          ? _value._moneyMeterModelList
          : moneyMeterModelList // ignore: cast_nullable_to_non_nullable
              as List<MoneyMeterModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MoneyMeterModelList extends _MoneyMeterModelList {
  const _$_MoneyMeterModelList(
      {final List<MoneyMeterModel> moneyMeterModelList =
          const <MoneyMeterModel>[]})
      : _moneyMeterModelList = moneyMeterModelList,
        super._();

  factory _$_MoneyMeterModelList.fromJson(Map<String, dynamic> json) =>
      _$$_MoneyMeterModelListFromJson(json);

  final List<MoneyMeterModel> _moneyMeterModelList;
  @override
  @JsonKey()
  List<MoneyMeterModel> get moneyMeterModelList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moneyMeterModelList);
  }

  @override
  String toString() {
    return 'MoneyMeterModelList(moneyMeterModelList: $moneyMeterModelList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoneyMeterModelList &&
            const DeepCollectionEquality()
                .equals(other._moneyMeterModelList, _moneyMeterModelList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_moneyMeterModelList));

  @JsonKey(ignore: true)
  @override
  _$$_MoneyMeterModelListCopyWith<_$_MoneyMeterModelList> get copyWith =>
      __$$_MoneyMeterModelListCopyWithImpl<_$_MoneyMeterModelList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MoneyMeterModelListToJson(this);
  }
}

abstract class _MoneyMeterModelList extends MoneyMeterModelList {
  const factory _MoneyMeterModelList(
          {final List<MoneyMeterModel> moneyMeterModelList}) =
      _$_MoneyMeterModelList;
  const _MoneyMeterModelList._() : super._();

  factory _MoneyMeterModelList.fromJson(Map<String, dynamic> json) =
      _$_MoneyMeterModelList.fromJson;

  @override
  List<MoneyMeterModel> get moneyMeterModelList;
  @override
  @JsonKey(ignore: true)
  _$$_MoneyMeterModelListCopyWith<_$_MoneyMeterModelList> get copyWith =>
      throw _privateConstructorUsedError;
}
