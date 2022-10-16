// Flutter imports:
import 'package:budget_scouter/main.dart';
import 'package:budget_scouter/view/common/logo_image.dart';
import 'package:budget_scouter/view/page/money_meter_page.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import '../../constant/style.dart';
import '../../enum/bottom_navigation_bar_enum.dart';
import '../../util/admob.dart';

final bottomNavigtionIndex = StateProvider<int>(((ref) => 0));

class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(bottomNavigtionIndex);
    final canBack = ref.watch(moneyMeterProvider.select((value) => value.canBack));
    return Scaffold(
      appBar: AppBar(
        title: const LogoImage(),
        backgroundColor: kDarkBackColor,
        elevation: 0,
        actions: [
          pageIndex == 0
              ? IconButton(
                  onPressed: canBack ? () => ref.read(moneyMeterProvider.notifier).backInput() : null,
                  icon: Icon(
                    FontAwesomeIcons.rotateLeft,
                    color: canBack ? ref.watch(colorThemeProvider) : Colors.grey,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(kSpacing),
        child: BottomNavigationBarEnum.values.map((item) => item.page).toList()[pageIndex],
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
