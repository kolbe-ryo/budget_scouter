// Flutter imports:
import 'package:budget_scouter/constant/style.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:

class InputTile extends ConsumerWidget {
  const InputTile({
    required this.title,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  final String title;
  final String hintText;

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
          onChanged: (String text) => null,
          style: kTextStyleSecondary,
        ),
      ],
    );
  }
}
