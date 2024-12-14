import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider_base/screens/product_screen/product_variables.dart';
import '../../models/product_list_model.dart';

class ProductProvider with ChangeNotifier, ProductVariables {
  ProductProvider() {
    getAllProducts();
  }

  Future<void> getAllProducts({bool showToast = false}) async {
    isLoading = true;
    isError = false;
    notifyListeners();
    List<AllProduct>? fetchedProducts =
        await productRepository.fetchAllProducts(showToast: showToast);
    if (fetchedProducts != null) {
      allProducts = fetchedProducts;
    } else {
      isError = true;
    }

    isLoading = false;
    notifyListeners();
  }

  void addToCart(AllProduct data) {
    cartList.add(data);
    data.isAddedToCart = true;
    Fluttertoast.showToast(
        msg: "Product added to cart",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    notifyListeners();
  }

  void removeFromCart(AllProduct data) {
    cartList.remove(data);
    data.isAddedToCart = false;
    Fluttertoast.showToast(
        msg: "Product removed from cart",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    notifyListeners();
  }

  notify() {
    notifyListeners();
  }
}
