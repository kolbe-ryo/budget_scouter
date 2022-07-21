// Flutter imports:
import 'package:budget_scouter/constant/style.dart';
import 'package:budget_scouter/view/modal/money_meter_initital_setting_modal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoneyMeterAdditionalWidget extends StatelessWidget {
  const MoneyMeterAdditionalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const FaIcon(
          FontAwesomeIcons.gauge,
          color: kDarkTextColor,
          size: 60,
        ),
        const SizedBox(height: kSpacing),
        TextButton(
          child: Text(
            AppLocalizations.of(context)!.additionalMeter,
            style: kTextStylePrimary,
          ),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => const MoneyMeterInitialSettingModal()),
              fullscreenDialog: true,
            ),
          ),
        ),
      ],
    );
  }
}
