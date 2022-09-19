// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../constant/style.dart';
import '../../enum/currency_data_enum.dart';
import '../../main.dart';
import 'selected_icon_button.dart';

// Project imports:

class CurrencySelectTile extends ConsumerWidget {
  const CurrencySelectTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(top: kSpacing),
          title: Text(
            'Currency',
            style: kTextStylePrimary(ref.watch(colorThemeProvider)),
          ),
        ),
        Row(
          children: CurrencyDataEnum.values
              .map(
                (value) => Padding(
                  padding: const EdgeInsets.only(right: kSpacing),
                  child: SelectedIconButton(value),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
