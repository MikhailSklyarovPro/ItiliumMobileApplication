import 'package:firstapp/widgets/myApprovalsWindow/attachedFiles.dart';
import 'package:firstapp/widgets/myApprovalsWindow/relatedDocuments.dart';
import 'package:firstapp/widgets/myRequestsWindow/detailedRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthorizationWindow(),
        '/myOutfitsWindow': (context) => const MyOutfitsWindow(),
        '/myRequestsWindow': (context) => const MyRequestsWindow(),
        '/myApprovalsWindow': (context) => const MyApprovalsWindow(),
        '/myOutfitsWindow/detailedOutfit': (context) => const DetailedOutfit(),
        '/myOutfitsWindow/detailedORequest': (context) => const DetailedRequest(),
        '/myApprovalsWindow/detailedApprovals': (context) => const DetailedApprovals(),
        '/myOutfitsWindow/detailedOutfit/relatedApprovals': (context) => const RelatedApprovals(),
        '/myApprovalsWindow/detailedApprovals/attachedFiles': (context) => const AttachedFiles(),
        '/myApprovalsWindow/detailedApprovals/relatedDocuments': (context) => const RelatedDocuments(),
      },
    );
  }
}
