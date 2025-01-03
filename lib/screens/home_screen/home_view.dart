import 'package:flutter/material.dart';
import '../../navigation/app_routes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.counter.route);
              },
              child: Text('Go to Counter Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.user.route,
                  arguments: 'John Doe',
                );
              },
              child: Text('Go to User Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.product.route,
                );
              },
              child: Text('Go to Product Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.messageScreen.route,
                );
              },
              child: Text('Go to Message Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
