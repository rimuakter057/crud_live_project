
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../data/models/product.dart';
import '../widget/product_item.dart';
import 'add_new_product_screen.dart';

class ProductListScreens extends StatefulWidget {
  const ProductListScreens({super.key});

  @override
  State<ProductListScreens> createState() => _ProductListScreensState();
}

class _ProductListScreensState extends State<ProductListScreens> {
  List <Product> productList = [];
  bool productLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context,AddNewProductScreen.name);
      },),
      body: RefreshIndicator(
        onRefresh: () async{
          getProductList();
        },
        child: Visibility(
          visible: productLoading==false,
          replacement:  const Center(child: CircularProgressIndicator()),
          child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context,index){
            return ProductItem(product: productList[index],);
          }),
        ),
      ),
    );
  }

 Future < void > getProductList()async{
    productLoading = true;
    setState(() {

    });
    Uri url = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
    Response response =await get(url);

    if (response.statusCode == 200) {
      final decodeData =jsonDecode( response.body);
      for(Map<String,dynamic>p in decodeData['data']){
        Product product = Product(
          id: p['_id'],
          productName: p['ProductName'],
          productCode: p['ProductCode'],
          quantity: p['Qty'],
          unitPrice: p['UnitPrice'],
          image: p['Img'],
          totalPrice: p['TotalPrice'],
          createdDate: p['CreatedDate'],

        );
        productList.add(product);
      }
    }
    productLoading=false;
    setState(() {

    });
  }


}


