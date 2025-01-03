import 'package:flutter/cupertino.dart';
import 'package:provider_base/repositories/message_screen_repository.dart';

mixin MessageScreenVariables{

  MessageScreenRepository messageScreenRepository = MessageScreenRepository();

  TextEditingController messageController = TextEditingController();

  bool isMessageEmpty = false;

}