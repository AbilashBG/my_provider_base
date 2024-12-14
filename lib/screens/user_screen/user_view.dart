import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base/screens/user_screen/user_provider.dart';

import '../../utils/local_providers/local_provider.dart';

class UserScreen extends StatelessWidget {
  final String userName;
  const UserScreen({super.key,required this.userName});

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserProvider,LocalProvider>(
      builder: (context, userProvider,localProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${localProvider.data}'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'User name from previous screen ${userName}',
                ),
                Text(
                  'Hello, ${userProvider.user.name}! Age: ${userProvider.user.age}',
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    controller: userProvider.nameController,
                    decoration: InputDecoration(labelText: 'Enter new name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: userProvider.ageController,
                    decoration: InputDecoration(labelText: 'Enter new age'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    String name = userProvider.nameController.text;
                    int age = int.parse(userProvider.ageController.text);
                    userProvider.updateUser(name, age);
                  },
                  child: Text('Update User'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
