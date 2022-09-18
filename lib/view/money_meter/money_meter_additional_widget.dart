// Flutter imports:
import 'package:budget_scouter/main.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import '../../constant/style.dart';
import '../modal/money_meter_initital_setting_modal.dart';

class MoneyMeterAdditionalWidget extends ConsumerWidget {
  const MoneyMeterAdditionalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            style: kTextStylePrimary(ref.watch(colorThemeProvider)),
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
