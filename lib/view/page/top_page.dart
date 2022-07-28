// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../util/admob.dart';
import '../../constant/style.dart';
import '../../enum/bottom_navigation_bar_enum.dart';
import '../common/app_bar.dart';

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
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder(
            future: Admob.getBannerWidget(context: context),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data as Widget;
              }
              return const Center(child: CircularProgressIndicator());
            }),
          ),
          BottomNavigationBar(
            items: BottomNavigationBarEnum.values.map((item) => item.bottomNavigationBarItem(context)).toList(),
            currentIndex: pageIndex,
            onTap: (int index) => ref.read(bottomNavigtionIndex.notifier).update((state) => state = index),
          ),
        ],
      ),
    );
  }
}
