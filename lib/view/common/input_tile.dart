// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../constant/style.dart';

// Project imports:

class InputTile extends ConsumerWidget {
  const InputTile({
    required this.title,
    required this.hintText,
    required this.numOnly,
    Key? key,
  }) : super(key: key);

  final String title;
  final String hintText;
  final bool numOnly;

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
          inputFormatters: numOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
          onChanged: (String text) => print(text),
          onEditingComplete: () => print('onEditingComplete'),
          onFieldSubmitted: (_) => print('onFieldSubmitted'),
          onSaved: (_) => print('onSaved'),
          keyboardType: numOnly ? TextInputType.number : null,
          style: kTextStyleSecondary,
        ),
      ],
    );
  }
}
