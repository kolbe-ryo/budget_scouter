// Flutter imports:
import 'package:budget_scouter/constant/style.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import '../../enum/currency_data_enum.dart';

class SelectedIconButton extends ConsumerWidget {
  const SelectedIconButton(this.genreData, {Key? key}) : super(key: key);

  final CurrencyDataEnum genreData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            genreData.icon,
            color: kThemeColor,
            size: 30,
          ),
        ),
        Text(
          genreData.name,
          style: kTextStyleSecondary,
        )
      ],
    );
  }
}
