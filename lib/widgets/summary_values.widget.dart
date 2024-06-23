import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class SummaryValues extends StatelessWidget {
  const SummaryValues({
    super.key,
    required this.calculateNotBuyedItem,
    required this.calculateBuyedItem,
  });

  final double calculateNotBuyedItem;
  final double calculateBuyedItem;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Não Marcados",
            ),
            Text(
              "R\$ ${calculateNotBuyedItem.toStringAsFixed(2).replaceAll(".", ",")}",
              style: TextStyle(
                color: appColors.combineWithPrimaryColor,
                fontSize: 19,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Marcados",
            ),
            Text(
              "R\$ ${calculateBuyedItem.toStringAsFixed(2).replaceAll(".", ",")}",
              style: TextStyle(
                color: appColors.primaryColor,
                fontSize: 19,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
