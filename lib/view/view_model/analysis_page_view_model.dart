// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import '../../interface/shared_preference_interfage.dart';
import '../../service/shared_preference_service.dart';
import '../state/analysis_page_state.dart';

class AnalysisPageViewModel extends StateNotifier<AnalysisPageState> {
  AnalysisPageViewModel() : super(AnalysisPageState());

  final SharedPreferenceInterface _storage = SharedPreferenceService(SharedPreferences.getInstance());
}
