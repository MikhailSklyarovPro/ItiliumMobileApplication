import 'package:firstapp/widgets/attachedFiles/attachedFiles.dart';
import 'package:firstapp/widgets/myRequestsWindow/detailedRequest.dart';
import 'package:firstapp/widgets/relatedDocuments/detailedLinkedOutfit.dart';
import 'package:firstapp/widgets/relatedDocuments/relatedDocuments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'authorization/authorization.dart';
import 'myApprovalsWindow/detailedApprovals.dart';
import 'myApprovalsWindow/myApprovalsWindow.dart';
import 'myOutfitsWindow/detailedOutfit.dart';
import 'myOutfitsWindow/myOutfitsWindow.dart';
import 'myRequestsWindow/myRequestsWindow.dart';

void main() {
  runApp( const Application());
}


class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthorizationWindow(),
        '/myOutfitsWindow': (context) => const MyOutfitsWindow(),
        '/myOutfitsWindow/detailedOutfit': (context) => const DetailedOutfit(),

        '/myRequestsWindow': (context) => const MyRequestsWindow(),
        '/myRequestsWindow/detailedORequest': (context) => const DetailedRequest(),

        '/myApprovalsWindow': (context) => const MyApprovalsWindow(),
        '/myApprovalsWindow/detailedApprovals': (context) => const DetailedApprovals(),

        '/linkedDocuments/detailedLinkedOutfit': (context) => const DetailedLinkedOrder(),
      },
    );
  }
}
