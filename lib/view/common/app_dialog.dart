// Flutter imports:
import 'package:flutter/cupertino.dart';

class AppDialog extends StatelessWidget {
  const AppDialog(this.message, {Key? key}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(message),
      // content: const Text("パスワード名称を入力してください"),
      actions: [
        CupertinoDialogAction(
          child: const Text("OK"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
