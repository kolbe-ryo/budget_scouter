import 'package:budget_scouter/constant/style.dart';
import 'package:budget_scouter/enum/bottom_navigation_bar_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigtionIndex = StateProvider<int>(((ref) => 0));

class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(bottomNavigtionIndex);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kSpacing),
        child: BottomNavigationBarEnum.values.map((item) => item.page()).toList()[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: BottomNavigationBarEnum.values.map((item) => item.bottomNavigationBarItem(context)).toList(),
        currentIndex: pageIndex,
        onTap: (int index) => ref.read(bottomNavigtionIndex.notifier).update((state) => state = index),
      ),
    );
  }
}
