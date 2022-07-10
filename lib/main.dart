// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'view/page/top_page.dart';

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
