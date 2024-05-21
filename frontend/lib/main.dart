import 'package:flutter/material.dart';
import 'package:frontend/otp_screen.dart';
import 'home_screen.dart';
import 'family_members.dart';
import 'notifications.dart';
import 'settings.dart';

void main() {
  runApp(MyFamilyConnectApp());
}

class MyFamilyConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyFamilyConnectApp',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/otp',
      routes: {
        '/otp': (context) => OTPScreen(phoneNumber: '057-263-3553'),
        '/home': (context) => const Homepage(),
        '/family_members': (context) => FamilyMembersScreen(),
        '/notifications': (context) => NotificationsScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
