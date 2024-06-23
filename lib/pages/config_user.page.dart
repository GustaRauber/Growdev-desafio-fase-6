import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../stores/theme.store.dart';

class ConfigUserPage extends StatelessWidget {
  final themeStore = GetIt.I.get<ThemeStore>();
  ConfigUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferências do usuário"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Aparência"),
            SizedBox(
              width: 150,
              child: DropdownButton(
                onChanged: (value) => themeStore.changeThemeMode(value!),
                value: themeStore.themeMode.value,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text("Claro"),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text("Escuro"),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text("Sistema"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
