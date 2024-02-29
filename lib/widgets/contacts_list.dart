import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/controllers/chat_listing_controller.dart';
import 'package:whatsapp_ui/screens/mobile_chat_screen.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatListingNotifier = Provider.of<ChatListingNotifier>(context);
    if (chatListingNotifier.chats.isEmpty) {
      chatListingNotifier.chatList();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Consumer<ChatListingNotifier>(
          builder: (context, chatListingNotifier, child) {
        if (chatListingNotifier.chats.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: chatListingNotifier.chats.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MobileChatScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        title: Text(
                          chatListingNotifier.chats[index]['name'].toString(),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            chatListingNotifier.chats[index]['message']
                                .toString(),
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            chatListingNotifier.chats[index]['profilePic']
                                .toString(),
                          ),
                          radius: 30,
                        ),
                        trailing: Text(
                          chatListingNotifier.chats[index]['time'].toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(color: dividerColor, indent: 85),
                ],
              );
            },
          );
        }
      }),
    );
  }
}
