import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_base/screens/telegram_messager_screen/message_screen_variables.dart';

class MessageScreenProvider with ChangeNotifier, MessageScreenVariables {
  MessageScreenProvider() {}

  Future<void> sendMessage() async {
    if (messageController.text.isNotEmpty) {
      isMessageEmpty = false;
      await messageScreenRepository.sendTelegramMessage(messageController.text);
      messageController.clear();
      notify();
    } else {
      isMessageEmpty = true;
    }
    notify();
  }

  notify() {
    notifyListeners();
  }
}
