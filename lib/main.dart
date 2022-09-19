// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'view/page/money_meter_page.dart';
import 'view/page/top_page.dart';

void main() => runApp(const ProviderScope(child: BudgetScouter()));

final colorThemeProvider = StateProvider<Color>(((ref) {
  final balance = ref.watch(moneyMeterProvider.select((state) => state.moneyMeterModel.balance.toDouble()));
  final initBalance = ref.watch(moneyMeterProvider.select((state) => state.moneyMeterModel.initBalance.toDouble()));
  return balance > initBalance / 3 ? Colors.pinkAccent : Colors.amber;
}));

class BudgetScouter extends ConsumerWidget {
  const BudgetScouter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(colorThemeProvider);
    return MaterialApp(
      title: 'Money Meter',
      theme: ThemeData.dark().copyWith(
        bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
          selectedItemColor: color,
        ),
      ),
      home: const TopPage(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', ''),
        Locale('en', ''),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
