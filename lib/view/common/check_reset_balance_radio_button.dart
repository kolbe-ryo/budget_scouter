// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../constant/style.dart';
import '../../enum/radio_button_enum.dart';

class CheckResetBalanceRadioButton extends StatelessWidget {
  const CheckResetBalanceRadioButton({Key? key, required this.title, required this.description}) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
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
              value: RadioButtonEnum.yes,
              groupValue: RadioButtonEnum.yes,
              onChanged: (_) => print('yes'),
            ),
            Text(RadioButtonEnum.yes.name, style: kTextStyleSecondary),
            const SizedBox(width: kSpacing),
            Radio(
              activeColor: kThemeColor,
              value: RadioButtonEnum.no,
              groupValue: RadioButtonEnum.yes,
              onChanged: (_) => print('no'),
            ),
            Text(RadioButtonEnum.no.name, style: kTextStyleSecondary),
          ],
        ),
      ],
    );
  }
}
