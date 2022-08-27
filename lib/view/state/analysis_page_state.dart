// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../model/money_consumption_history_model.dart';

part 'analysis_page_state.freezed.dart';

@freezed
class AnalysisPageState with _$AnalysisPageState {
  const AnalysisPageState._();

  const factory AnalysisPageState({
    @Default(false) bool hasData,
    @Default('') String target,
    @Default(0) int year,
    @Default([MoneyConsumptionHistoryModel()]) List<MoneyConsumptionHistoryModel> currentExpentiture,
  }) = _AnalysisPageState;
}
