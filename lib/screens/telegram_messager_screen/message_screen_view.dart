import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base/screens/telegram_messager_screen/message_screen_provider.dart';
import 'package:provider_base/utils/local_providers/local_provider.dart';

class MessageScreenView extends StatelessWidget {
  const MessageScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MessageScreenProvider(),
        child: Consumer2<MessageScreenProvider, LocalProvider>(
            builder: (context, messageProvider, localProvider, child) {
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title: const Text("Messenger"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: TextField(
                                    onChanged: (val) {
                                      if (val.isNotEmpty) {
                                        messageProvider.isMessageEmpty = false;
                                      } else {
                                        messageProvider.isMessageEmpty = true;
                                      }
                                      messageProvider.notify();
                                    },
                                    controller:
                                        messageProvider.messageController,
                                    decoration: InputDecoration(
                                      hintText: "Enter your message",
                                      labelText: "Message",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: const BorderSide(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: const BorderSide(
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.send,
                                    color: Colors.blueAccent),
                                onPressed: () {
                                  if (!messageProvider.isMessageEmpty) {
                                    messageProvider.sendMessage();
                                  }
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          if (messageProvider.isMessageEmpty)
                            const Text(
                              "Message must not be empty",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        }));
  }
}
