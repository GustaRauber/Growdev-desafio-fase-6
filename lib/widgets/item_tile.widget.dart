import 'package:flutter/material.dart';

import '../models/item_list.model.dart';
import '../themes/app_colors.dart';

class ItemTile extends StatefulWidget {
  final ItemList item;
  final void Function() toggleCheckbox;
  const ItemTile({
    super.key,
    required this.item,
    required this.toggleCheckbox,
  });

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;
    return Row(
      children: [
        Transform.scale(
          scale: 1.5,
          alignment: Alignment.centerRight,
          child: Checkbox(
            key: const Key("checkbox"),
            shape: const CircleBorder(),
            side: BorderSide(
              color: appColors.combineWithPrimaryColor!,
            ),
            value: widget.item.buyed,
            onChanged: (value) => widget.toggleCheckbox(),
          ),
        ),
        Text(
          widget.item.name,
          style: theme.textTheme.titleMedium!.copyWith(
            color: widget.item.buyed ? Colors.grey : null,
          ),
        ),
        const Spacer(),
        Text(
          "R\$ ${widget.item.price.toStringAsFixed(2).replaceAll(".", ",")}",
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
