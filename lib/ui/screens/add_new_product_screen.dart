import 'package:flutter/material.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});
  static const String name = '/add-new-product';

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: buildProductForm(),
        ),
      ),
    );
  }

  Form buildProductForm() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _nameTEController,
            decoration: const InputDecoration(
              hintText: "name",
              labelText: "Product name",
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "enter product name";
              }
            },
          ),
          TextFormField(
            controller: _priceTEController,
            decoration: const InputDecoration(
              hintText: "price",
              labelText: "Product price",
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "enter product name";
              }
            },
          ),
          TextFormField(
            controller: _totalPriceTEController,
            decoration: const InputDecoration(
              hintText: "total price",
              labelText: "total price",
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "enter total price";
              }
            },
          ),
          TextFormField(
            controller: _quantityTEController,
            decoration: const InputDecoration(
              hintText: "quantity",
              labelText: "Product quantity",
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Product quantity";
              }
            },
          ),
          TextFormField(
            controller: _imageTEController,
            decoration: const InputDecoration(
              hintText: "image",
              labelText: "Product image",
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "enter product image";
              }
            },
          ),
          TextFormField(
            controller: _codeTEController,
            decoration: const InputDecoration(
              hintText: "code",
              labelText: "Product code",
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "enter product code";
              }
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () {}, child: const Text('Add Product'))
        ],
      ),
    );
  }
  @override
  void dispose() {
    _nameTEController.dispose();
    _codeTEController.dispose();
    _priceTEController.dispose();
    _totalPriceTEController.dispose();
    _imageTEController.dispose();
    _quantityTEController.dispose();
    super.dispose();
  }
}
