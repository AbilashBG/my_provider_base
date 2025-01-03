import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';
import '../screens/counter_screen/counter_view.dart';
import '../screens/home_screen/home_view.dart';
import '../screens/product_screen/cart_screen/cart_view_.dart';
import '../screens/product_screen/product_view.dart';
import '../screens/telegram_messager_screen/message_screen_view.dart';
import '../screens/user_screen/user_view.dart';

class NavigationUtils {
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      AppRoutes.home.route: (context) => HomeScreen(),
      AppRoutes.counter.route: (context) => CounterScreen(),
      AppRoutes.product.route: (context) => ProductListScreen(),
      AppRoutes.cart.route: (context) => CartScreen(),
      AppRoutes.messageScreen.route: (context) => MessageScreenView(),

      /// Passing user name as argument
      AppRoutes.user.route: (context) => UserScreen(
            userName: ModalRoute.of(context)?.settings.arguments as String,
          ),
    };
  }
}
