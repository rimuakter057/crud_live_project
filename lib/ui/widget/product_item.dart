import 'package:crud_live_project/ui/screens/update_product_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.circle),
      title: const Text("Product"),
      subtitle: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product Code:#0444"),
          Text("Quantity:#0444"),
          Text("price"),
          Text("Total price "),
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