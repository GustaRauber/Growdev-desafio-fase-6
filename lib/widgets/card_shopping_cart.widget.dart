import 'package:flutter/material.dart';

import '../models/shopping_list.model.dart';
import '../themes/app_colors.dart';

class CardShoppingCart extends StatelessWidget {
  final ShoppingList shoppingList;
  const CardShoppingCart({super.key, required this.shoppingList});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;
    final isDark = theme.brightness == Brightness.dark;
    return Card(
      key: const Key("card"),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  shoppingList.name,
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  "${shoppingList.qtdBuyedItems}/${shoppingList.items.length}",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: appColors.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            LinearProgressIndicator(
              backgroundColor: isDark ? Colors.white : Colors.grey,
              valueColor: AlwaysStoppedAnimation(appColors.primaryColor),
              value: shoppingList.items.isEmpty
                  ? 0
                  : (shoppingList.qtdBuyedItems / shoppingList.items.length),
              minHeight: 6,
            ),
          ],
        ),
      ),
    );
  }
}
