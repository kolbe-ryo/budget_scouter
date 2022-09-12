// Flutter imports:
import 'package:budget_scouter/constant/style.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kDarkBackColor,
      child: ListTile(
        contentPadding: const EdgeInsets.only(top: kSpacing),
        onTap: onTap,
        title: Text(
          title,
          style: kTextStyleSecondary,
        ),
        leading: Icon(
          icon,
          color: Colors.blueGrey,
        ),
        trailing: const Icon(Icons.keyboard_arrow_right),
      ),
      elevation: 0.5,
      margin: EdgeInsets.zero,
    );
  }
}
