import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import '../models/item_list.model.dart';
import '../themes/app_colors.dart';

class AddItemList extends StatefulWidget {
  const AddItemList({super.key});

  @override
  State<AddItemList> createState() => _AddItemListState();
}

class _AddItemListState extends State<AddItemList> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  Future<void> addItem() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    var price = 0.0;

    if (priceController.text.isNotEmpty) {
      price = double.parse(
        priceController.text.replaceAll(".", "").replaceAll(",", "."),
      );
    }

    final newItem = ItemList(
      name: nameController.text,
      price: price,
    );

    Navigator.of(context).pop(newItem);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Adicionar item",
                    style: theme.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
              const Divider(height: 0),
              TextFormField(
                key: const Key("inputNameItem"),
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Nome do item",
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Campo Obrigatório";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                key: const Key("intputPriceItem"),
                decoration: const InputDecoration(
                  hintText: "R\$ 0,00",
                  border: InputBorder.none,
                ),
                inputFormatters: [
                  CurrencyTextInputFormatter(locale: "pt_BR", symbol: ""),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: addItem,
                  child: const Text(
                    "Adicionar",
                    key: Key("btnAddItem"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
