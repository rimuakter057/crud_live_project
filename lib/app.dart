
import 'package:crud_live_project/ui/screens/add_new_product_screen.dart';
import 'package:crud_live_project/ui/screens/product_list_screen.dart';
import 'package:crud_live_project/ui/screens/update_product_screen.dart';
import 'package:flutter/material.dart';

class CRUDApp extends StatelessWidget {
  const CRUDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
     '/':(context)=>ProductListScreens(),
        AddNewProductScreen.name:(context)=>AddNewProductScreen( ),
        UpdateProductScreen.name:(context)=>UpdateProductScreen( ),

      },
    );
  }
}
