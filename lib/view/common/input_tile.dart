// Flutter imports:
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
    Key? key,
  }) : super(key: key);

  final String title;
  final String hintText;
  final bool numOnly;
  final bool isTarget;

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
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: kTextStyleHint,
          ),
          initialValue: '',
          inputFormatters: numOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
          keyboardType: numOnly ? TextInputType.number : null,
          style: kTextStyleSecondary,
          onChanged: (String text) {
            ref.read(initialMoneyMeterStateProvider.state).update(
                  (state) => isTarget
                      ? state.copyWith(target: text)
                      : state.copyWith(
                          initBalance: int.parse(text),
                        ),
                );
          },
        ),
      ],
    );
  }
}
