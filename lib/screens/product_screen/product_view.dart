import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base/screens/product_screen/product_provider.dart';
import 'package:provider_base/utils/local_providers/local_provider.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProductProvider,LocalProvider>(
        builder: (context,productProvider,localProvider,child){

          return Scaffold(
            appBar: AppBar(
              title: Text("${localProvider.data}"),
            ),
            body: ListView.builder(
              itemCount: productProvider.productList.length,
              itemBuilder: (context,index){
                var item = productProvider.productList[index];
                return Text("${item["name"]}");
              },
            ),
          );
    });
  }
}
