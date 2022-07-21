// Flutter imports:
import 'package:budget_scouter/constant/style.dart';
import 'package:budget_scouter/enum/currency_data_enum.dart';
import 'package:budget_scouter/view/common/selected_icon_button.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            style: kTextStylePrimary,
          ),
        ),
        Wrap(
          children: CurrencyDataEnum.values
              .map(
                (value) => SelectedIconButton(value),
              )
              .toList(),
        ),
      ],
    );
  }
}
