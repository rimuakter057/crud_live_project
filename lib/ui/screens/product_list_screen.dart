
import 'package:flutter/material.dart';

import '../widget/product_item.dart';
import 'add_new_product_screen.dart';

class ProductListScreens extends StatefulWidget {
  const ProductListScreens({super.key});

  @override
  State<ProductListScreens> createState() => _ProductListScreensState();
}

class _ProductListScreensState extends State<ProductListScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context,AddNewProductScreen.name);
      },),
      body: ListView.builder(itemBuilder: (context,index){
        return ProductItem();
      }),
    );
  }
}


