// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../model/money_consumption_history_model.dart';

part 'analysis_page_state.freezed.dart';

@freezed
class AnalysisPageState with _$AnalysisPageState {
  factory AnalysisPageState({
    @Default(MoneyConsumptionHistoryModel()) MoneyConsumptionHistoryModel currentExpentiture,
  }) = _AnalysisPageState;
}
