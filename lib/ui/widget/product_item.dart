import 'package:crud_live_project/models/product.dart';
import 'package:crud_live_project/ui/screens/update_product_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {

  const ProductItem({
    super.key, required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
   //  leading: const Icon(Icons.circle),
      title: Text(product.productName.toString()??''),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name:${product.productName ?? ''}"),
          Text("Code:${product.productCode ?? ''}"),
          Text("Unit Price:${product.unitPrice ?? ''}"),
          Text("Total Price:${product.totalPrice ?? ''}"),
        ],),
      trailing: Wrap(
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
          IconButton(onPressed: (){
            Navigator.pushNamed(context,UpdateProductScreen.name);
          }, icon: const Icon(Icons.edit)),
        ],
      ),
    );
  }
}