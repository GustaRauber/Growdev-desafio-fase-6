import 'package:fase_6/pages/add_shopping_list.page.dart';
import 'package:fase_6/pages/config_user.page.dart';
import 'package:fase_6/pages/item_list.page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'models/shopping_list.model.dart';
import 'my_routes.dart';
import 'pages/shopping_list.page.dart';
import 'stores/theme.store.dart';
import 'themes/themes.dart';

void main() {
  GetIt.I.registerSingleton(ThemeStore());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themeStore = GetIt.I.get<ThemeStore>();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeStore.themeMode,
      builder: (_, themeMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shopping List',
          themeMode: themeMode,
          theme: lightTheme(),
          darkTheme: darkTheme(),
          initialRoute: MyRoutes.shoppingList,
          routes: {
            MyRoutes.shoppingList: (_) => const ShoppingListPage(),
            MyRoutes.addShoppingList: (_) => const AddShoppingListPage(),
            MyRoutes.itemsList: (ctx) => ItemListPage(
                  shoppingList:
                      ModalRoute.of(ctx)!.settings.arguments as ShoppingList,
                ),
            MyRoutes.configUser: (_) => ConfigUserPage(),
          },
        );
      },
    );
  }
}
