// Flutter imports:
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Top')),
      body: ElevatedButton(
          onPressed: () => Navigator.of(context, rootNavigator: true)
              .push(MaterialPageRoute(builder: ((context) => const SettingPage()))),
          child: Text('Test')),
    );
  }
}
