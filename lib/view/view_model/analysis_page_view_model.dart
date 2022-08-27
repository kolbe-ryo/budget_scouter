// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../state/analysis_page_state.dart';
import 'money_meter_page_view_model.dart';

class AnalysisPageViewModel extends StateNotifier<AnalysisPageState> {
  AnalysisPageViewModel() : super(const AnalysisPageState());

  final _moneyMeterModel = MoneyMeterPageViewModel().storage;

  // 画面遷移時に最新のstateに更新する
  Future<void> fetch() async {
    final moneyMeterModel = await _moneyMeterModel.fetch();

    // mock data作成（グラフ用）

    // TODO: 必要なstateを抜いて更新する
    state = state.copyWith();
  }
}
