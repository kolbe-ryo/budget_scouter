import 'package:budget_scouter/constant/style.dart';
import 'package:budget_scouter/enum/radio_button_enum.dart';
import 'package:flutter/material.dart';

class RadioButtonTiles extends StatelessWidget {
  const RadioButtonTiles({Key? key, required this.title, required this.description}) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(top: kSpacing),
          title: Text(
            title,
            style: kTextStylePrimary,
          ),
        ),
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
