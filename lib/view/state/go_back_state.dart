// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'go_back_state.freezed.dart';

@freezed
class GoBackState with _$GoBackState {
  const factory GoBackState({
    @Default(false) bool canBack,
    @Default(false) bool canGo,
    @Default(0) int memorizedValue,
  }) = _GoBackState;
}
