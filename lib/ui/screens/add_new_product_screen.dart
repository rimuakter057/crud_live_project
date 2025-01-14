import 'dart:convert';
import 'package:crud_live_project/data/services.dart';
import 'package:crud_live_project/data/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewProductInProgress = false;
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

  // text from field
  Form buildProductForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
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
            const SizedBox(height: 15,),
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
            const SizedBox(height: 15,),
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
            const SizedBox(height: 15,),
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
            const SizedBox(height: 15,),
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
            const SizedBox(height: 15,),
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
            Visibility(
              visible: _addNewProductInProgress == false,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: ElevatedButton(onPressed: _onTap,
                  child: const Text('Add Product')),
            ),
          ],
        ),
      ),
    );
  }

  // add api function
  Future <void> addProduct() async {
    _addNewProductInProgress = true;
    setState(() {

    });

    //add body
    Map <String, dynamic> requestBody = {
      "Img": _imageTEController.text.trim(),
      "ProductCode": _codeTEController.text.trim(),
      "ProductName": _nameTEController.text.trim(),
      "Qty": _quantityTEController.text.trim(),
      "TotalPrice": _totalPriceTEController.text.trim(),
      "UnitPrice": _priceTEController.text.trim(),
    };

    // api instigation
    final NetworkResponse response = await NetworkCaller.postRequest(
        body: requestBody,
        url: Urls.addNewProduct);
    _addNewProductInProgress = true;
    setState(() {

    });
    if(response.isSuccess){
      _clearTextFields();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("success"),
          duration: const Duration(seconds: 4),
        ),
      );
    }else{
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("failed"),
          duration: const Duration(seconds: 4),
        ),
      );
    }

  }

// add button on tap
   void _onTap(){
     if(
     _formKey.currentState!.validate()){
       addProduct();
       _addNewProductInProgress =false;
     }else{
       print("not valid");
     }
   }

  void _clearTextFields() {
    _nameTEController.clear();
    _codeTEController.clear();
    _priceTEController.clear();
    _totalPriceTEController.clear();
    _imageTEController.clear();
    _quantityTEController.clear();
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
