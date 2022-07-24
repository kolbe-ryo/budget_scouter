// Flutter imports:
import 'package:budget_scouter/constant/style.dart';
import 'package:budget_scouter/view/page/money_meter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppDialog extends StatelessWidget {
  const AppDialog(this.message, {Key? key}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(message),
      actions: [
        CupertinoDialogAction(
          child: const Text("OK"),
          onPressed: () => Navigator.pop(context),
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
      title: const Text('Use Money'),
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
