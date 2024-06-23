import 'package:flutter/material.dart';

class EmptyShoppingList extends StatelessWidget {
  const EmptyShoppingList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/lista-de-compras.png",
          key: const Key("imageWithoutList"),
          height: 120,
        ),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: Text(
            "Crie sua primeira lista.",
            style: theme.textTheme.titleMedium,
          ),
        ),
        Center(
          child: Text(
            "Toque no botão azul",
            style: theme.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
