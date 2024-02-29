import 'package:flutter/material.dart';

List<Map<String, dynamic>> mockMessages = [
  {"isMe": false, "text": "Hey, What's up!!", "time": "10:00 am"},
  {"isMe": true, "text": "I am fine, What about you?", "time": "11:00 am"},
  {"isMe": false, "text": "I am good!", "time": "11:01 am"},
  {
    "isMe": false,
    "text": "Need a little favor.",
    "time": "11:01 am"
  },
  {"isMe": true, "text": "Obviously! say", "time": "11:03 am"},
  {
    "isMe": false,
    "text": "haha I wanted you to check out my new technical blog ^^",
    "time": "11:04 am"
  },
  {
    "isMe": true,
    "text": " Sure, where it is?",
    "time": "11:05 am"
  },
  {
    "isMe": false,
    "text": "On Medium",
    "time": "11:06 am",
  },
  {
    "isMe": true,
    "text": "It's really informative!",
    "time": "11:15 am",
  },
  

  {"isMe": false, "text": "Thanks bro!", "time": "11:17 am"},
  {
    "isMe": false,
    "text": "Did you Like it?",
    "time": "11:16 am"
  },
  {
    "isMe": true,
    "text": "Yes, ofcourse bro!",
    "time": "11:17 am"
  },
  {
    "isMe": false,
    "text": "Cool!",
    "time": "11:18 am",
  },
  {
    "isMe": true,
    "text": "I really enjoyed it?",
    "time": "11:19 am",
  },
  {
    "isMe": false,
    "text": "Woah! Thanks!",
    "time": "11:20 am",
  },
];


class IndividualChatNotifier extends ChangeNotifier {
    List<Map<String, dynamic>> messages = [];

    Future<void> messageList() async {
      await Future.delayed(const Duration(seconds: 1));
      messages = mockMessages;
      notifyListeners();
  }
}