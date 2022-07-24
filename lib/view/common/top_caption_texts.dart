// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../constant/style.dart';

class TopCaptionTexts extends StatelessWidget {
  const TopCaptionTexts({Key? key, required this.title, required this.content}) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: kTextStyleHint),
        const SizedBox(height: kSpacing / 2),
        Text(
          content,
          style: kTextStyleCaption(),
        ),
      ],
    );
  }
}
