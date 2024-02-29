import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/controllers/individual_chat_controller.dart';
import 'package:whatsapp_ui/widgets/my_message_card.dart';
import 'package:whatsapp_ui/widgets/sender_message_card.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final individualChatNotifier = Provider.of<IndividualChatNotifier>(context);
    if (individualChatNotifier.messages.isEmpty) {
      individualChatNotifier.messageList();
    }

    return Consumer<IndividualChatNotifier>(
        builder: (context, individualChatNotifier, child) {
      if (individualChatNotifier.messages.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
          itemCount: individualChatNotifier.messages.length,
          itemBuilder: (context, index) {
            if (individualChatNotifier.messages[index]['isMe'] == true) {
              return MyMessageCard(
                message:
                    individualChatNotifier.messages[index]['text'].toString(),
                date: individualChatNotifier.messages[index]['time'].toString(),
              );
            }
            return SenderMessageCard(
              message:
                  individualChatNotifier.messages[index]['text'].toString(),
              date: individualChatNotifier.messages[index]['time'].toString(),
            );
          },
        );
      }
    });
  }
}
