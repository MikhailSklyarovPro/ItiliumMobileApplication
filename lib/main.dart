import 'package:firstapp/authorization/authorization.dart';
import 'package:firstapp/myOutfitsWindow/detailedOutfit.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/myOutfitsWindow/myOutfitsWindow.dart';
import 'package:firstapp/myApprovalsWindow/myApprovalsWindow.dart';
import 'package:firstapp/myRequestsWindow/myRequestsWindow.dart';

void main() {
  runApp( const Application());
}


class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthorizationWindow(),
        '/myOutfitsWindow': (context) => const MyOutfitsWindow(),
        '/myRequestsWindow': (context) => const MyRequestsWindow(),
        '/myApprovalsWindow': (context) => const MyApprovalsWindow(),
        '/myOutfitsWindow/detailedOutfit': (context) => const DetailedOutfit(),
      },
    );
  }
}
