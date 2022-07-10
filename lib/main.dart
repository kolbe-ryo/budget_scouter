// Flutter imports:
import 'package:budget_scouter/view/page/top_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: BudgetScouter()));

class BudgetScouter extends StatelessWidget {
  const BudgetScouter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Meter',
      theme: ThemeData.dark().copyWith(
        bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
          selectedItemColor: Colors.deepOrange,
        ),
      ),
      home: const TopPage(),
    );
  }
}
