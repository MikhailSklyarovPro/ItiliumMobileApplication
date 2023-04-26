import 'package:flutter/material.dart';

import 'authorization/authorization.dart';
import 'myApprovalsWindow/detailedApprovals.dart';
import 'myApprovalsWindow/myApprovalsWindow.dart';
import 'myOutfitsWindow/detailedOutfit.dart';
import 'myOutfitsWindow/myOutfitsWindow.dart';
import 'myOutfitsWindow/relatedApprovals.dart';
import 'myRequestsWindow/myRequestsWindow.dart';

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
        '/myApprovalsWindow/detailedApprovals': (context) => const DetailedApprovals(),
        '/myOutfitsWindow/detailedOutfit/relatedApprovals': (context) => const RelatedApprovals(),
      },
    );
  }
}
