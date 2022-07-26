// Flutter imports:
import 'package:budget_scouter/view/modal/use_money_input_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../constant/style.dart';
import '../modal/money_meter_initital_setting_modal.dart';

// Project imports:

class InputTile extends ConsumerWidget {
  const InputTile({
    required this.title,
    required this.hintText,
    required this.numOnly,
    required this.isTarget,
    this.isUseMoney = false,
    Key? key,
  }) : super(key: key);

  final String title;
  final String hintText;
  final bool numOnly;
  final bool isTarget;
  final bool isUseMoney;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(top: kSpacing),
          title: Text(
            title,
            style: kTextStylePrimary,
          ),
        ),
        TextFormField(
            autofocus: isUseMoney,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: kTextStyleHint,
            ),
            initialValue: '',
            inputFormatters: numOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
            keyboardType: numOnly ? TextInputType.number : null,
            style: kTextStyleSecondary,
            onChanged: (String text) {
              if (isUseMoney) {
                ref.read(useMoneyState.state).update((state) => int.parse(text));
              } else {
                ref.read(initialMoneyMeterStateProvider.state).update(
                      (state) => isTarget ? state.copyWith(target: text) : state.copyWith(initBalance: int.parse(text)),
                    );
              }
            }),
      ],
    );
  }
}
