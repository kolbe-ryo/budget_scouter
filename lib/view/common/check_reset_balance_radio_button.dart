// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../constant/style.dart';
import '../../enum/radio_button_enum.dart';
import '../modal/money_meter_initital_setting_modal.dart';

class CheckResetBalanceRadioButton extends ConsumerWidget {
  const CheckResetBalanceRadioButton({Key? key, required this.title, required this.description}) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelect = ref.watch(initialMoneyMeterStateProvider.select((state) => state.isForwardBalance));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(top: kSpacing),
          title: Text(title, style: kTextStylePrimary),
        ),
        Text(description, style: kTextStyleHint),
        const SizedBox(height: kSpacing),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio(
              activeColor: kThemeColor,
              value: RadioButtonEnum.yes.boolean,
              groupValue: isSelect,
              onChanged: (_) => ref
                  .read(initialMoneyMeterStateProvider.state)
                  .update((state) => state.copyWith(isForwardBalance: RadioButtonEnum.yes.boolean)),
            ),
            Text(RadioButtonEnum.yes.name, style: kTextStyleSecondary),
            const SizedBox(width: kSpacing),
            Radio(
              activeColor: kThemeColor,
              value: RadioButtonEnum.no.boolean,
              groupValue: isSelect,
              onChanged: (_) => ref
                  .read(initialMoneyMeterStateProvider.state)
                  .update((state) => state.copyWith(isForwardBalance: RadioButtonEnum.no.boolean)),
            ),
            Text(RadioButtonEnum.no.name, style: kTextStyleSecondary),
          ],
        ),
      ],
    );
  }
}
