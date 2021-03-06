// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../constant/style.dart';
import '../../enum/bottom_navigation_bar_enum.dart';
import '../common/app_bar.dart';
import '../common/logo_image.dart';

final bottomNavigtionIndex = StateProvider<int>(((ref) => 0));

class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(bottomNavigtionIndex);
    return Scaffold(
      appBar: CustomAppBar.appBar,
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
