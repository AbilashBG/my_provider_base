import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base/screens/product_screen/product_provider.dart';
import 'package:provider_base/utils/local_providers/local_provider.dart';

import '../../navigation/app_routes.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // ChangeNotifierProvider(
        // create: (context) => ProductProvider(),
        // child:
        Consumer2<ProductProvider, LocalProvider>(
            builder: (context, productProvider, localProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
          actions: [
            Badge(
              offset: Offset(0, 4),
              isLabelVisible: productProvider.cartList.isEmpty ? false : true,
              label: Text("${productProvider.cartList.length}"),
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.cart.route,
                    );
                  },
                  icon: Icon(
                    Icons.card_travel_rounded,
                    color: Colors.green,
                  )),
            ),
            const SizedBox(
              width: 30,
            )
          ],
        ),
        body: productProvider.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : productProvider.isError
                ? Center(
                    child: Column(
                      children: [
                        Text(
                          "Something went wrong",
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await productProvider.getAllProducts(
                                showToast: true);
                          },
                          child: Text(
                            "Retry",
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: productProvider.allProducts.length,
                    itemBuilder: (context, index) {
                      var item = productProvider.allProducts[index];
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
                        trailing: !item.isAddedToCart
                            ? IconButton(
                                onPressed: () {
                                  productProvider.addToCart(item);
                                  productProvider.notify();
                                },
                                icon: Icon(
                                  Icons.add,
                                ),
                              )
                            : SizedBox(),
                      );
                    },
                  ),
      );
    });
    // );
  }
}
