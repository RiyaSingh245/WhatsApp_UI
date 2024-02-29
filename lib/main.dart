import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/controllers/chat_listing_controller.dart';
import 'package:whatsapp_ui/controllers/individual_chat_controller.dart';
import 'package:whatsapp_ui/screens/mobile_screen_layout.dart';
import 'package:whatsapp_ui/screens/web_screen_layout.dart';
import 'package:whatsapp_ui/utils/responsive_layout.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ChatListingNotifier()),
      ChangeNotifierProvider(create: (context) => IndividualChatNotifier()),
    ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      home: const ResponsiveLayout(mobileScreenLayout: MobileLayoutScreen(), webScreenLayout: WebLayoutScreen()),
      );
  }
}

