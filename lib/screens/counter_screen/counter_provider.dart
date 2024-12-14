import 'package:flutter/material.dart';
import 'counter_variables.dart';

class CounterProvider with ChangeNotifier, CounterVariables {

  CounterProvider(){
    print("Hello");
  }

  int get currentCount => count;

  void increment() {
    count++;
    notifyListeners();
  }
}
