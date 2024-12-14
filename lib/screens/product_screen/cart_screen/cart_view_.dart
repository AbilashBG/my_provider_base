import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base/screens/product_screen/product_provider.dart';
import 'package:provider_base/utils/local_providers/local_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProductProvider, LocalProvider>(
        builder: (context, productProvider, localProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Cart Screen"),
        ),
        body: productProvider.cartList.isNotEmpty? ListView.builder(
          itemCount: productProvider.cartList.length,
          itemBuilder: (context, index) {
            var item = productProvider.cartList[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.image ?? ""),
              ),
              title: Text("${item.title}"),
              subtitle: Text(
                "${item.description}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () {
                  productProvider.removeFromCart(item);
                },
                icon: Icon(Icons.remove),
                color: Colors.red,
              ),
            );
          },
        ):Center(
          child: Text("Empty Cart Data"),
        ),
      );
    });
  }
}
