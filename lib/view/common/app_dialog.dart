// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../constant/style.dart';
import '../page/money_meter_page.dart';

class AppDialog extends StatelessWidget {
  const AppDialog(this.message, {Key? key, this.isDeleteAction = false}) : super(key: key);

  final String message;
  final bool isDeleteAction;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(message),
      actions: [
        CupertinoDialogAction(
          child: const Text("OK"),
          onPressed: () => Navigator.pop(context, true),
        ),
        if (isDeleteAction)
          CupertinoDialogAction(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context, false),
          ),
      ],
    );
  }
}

class InputDialog extends ConsumerWidget {
  const InputDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String money = '0';
    return CupertinoAlertDialog(
      title: Text(AppLocalizations.of(context)!.input_money),
      content: Padding(
        padding: const EdgeInsets.only(top: kSpacing),
        child: CupertinoTextField(
          autofocus: true,
          placeholder: 'ex) 120',
          placeholderStyle: kTextStyleHint,
          decoration: const BoxDecoration(color: kDarkBackColor),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          style: kTextStyleSecondary,
          onChanged: (String text) => money = text,
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: const Text("OK"),
          onPressed: () {
            ref.read(moneyMeterProvider.notifier).use(int.parse(money));
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
