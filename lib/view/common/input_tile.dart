// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../constant/style.dart';
import '../../main.dart';
import '../modal/money_meter_initital_setting_modal.dart';
import '../page/money_meter_page.dart';

// Project imports:

class InputTile extends ConsumerWidget {
  const InputTile({
    required this.title,
    required this.hintText,
    required this.numOnly,
    required this.isTarget,
    required this.formKey,
    Key? key,
  }) : super(key: key);

  final String title;
  final String hintText;
  final bool numOnly;
  final bool isTarget;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialText = ref.watch(
      moneyMeterProvider.select(
        (value) => isTarget ? value.moneyMeterModel.target : value.moneyMeterModel.initBalance.toString(),
      ),
    );
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(top: kSpacing),
          title: Text(
            title,
            style: kTextStylePrimary(ref.watch(colorThemeProvider)),
          ),
        ),
        Form(
          key: formKey,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: kTextStyleHint,
            ),
            initialValue: initialText != '0' ? initialText : '',
            inputFormatters: numOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
            keyboardType: numOnly ? TextInputType.number : null,
            style: kTextStyleSecondary,
            onChanged: (String text) {
              if (text.isEmpty) {
                text = '0';
              }
              ref.read(initialMoneyMeterStateProvider.state).update(
                    (state) => isTarget ? state.copyWith(target: text) : state.copyWith(initBalance: int.parse(text)),
                  );
            },
          ),
        ),
      ],
    );
  }
}
