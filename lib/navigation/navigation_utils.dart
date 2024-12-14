import 'package:flutter/material.dart';
import 'package:provider_base/screens/product_screen/cart_screen/cart_view_.dart';
import 'package:provider_base/screens/product_screen/product_view.dart';
import '../navigation/app_routes.dart';
import '../screens/counter_screen/counter_view.dart';
import '../screens/home_screen/home_view.dart';
import '../screens/user_screen/user_view.dart';

class NavigationUtils {
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      AppRoutes.home.route: (context) => HomeScreen(),
      AppRoutes.counter.route: (context) => CounterScreen(),
      AppRoutes.product.route: (context) => ProductListScreen(),
      AppRoutes.cart.route: (context) => CartScreen(),

      /// Passing user name as argument
      AppRoutes.user.route: (context) => UserScreen(
            userName: ModalRoute.of(context)?.settings.arguments as String,
          ),
    };
  }
}
