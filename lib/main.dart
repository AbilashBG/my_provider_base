import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base/screens/product_screen/product_provider.dart';
import 'package:provider_base/utils/local_providers/local_provider.dart';
import 'screens/counter_screen/counter_provider.dart';
import 'screens/user_screen/user_provider.dart';
import 'navigation/navigation_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocalProvider()),
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Provider Example',
        initialRoute: '/',
        routes: NavigationUtils.getRoutes(context),
      ),
    );
  }
}
