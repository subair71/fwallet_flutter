import 'package:flutter/material.dart';
import 'package:mpay/feature/user/presentation/home_body_layout.dart';
import 'package:mpay/feature/user/presentation/user_screen.dart';
import 'package:mpay/feature/beneficiary/presentation/view/add_beneficiary_dialog%20screen.dart';
import 'package:mpay/core/routes/index.dart';


class AppRoute {
  Map<String, Widget Function(BuildContext)> route = {
    routeName.scanPayScreen: (p0) => const UserScreen(),
    routeName.home: (p0) => const HomeBodyLayout(),

    // routeName.topup: (context) {
    // final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // return TopUpPage.fromRouteArguments(args);
  // },
    routeName.addBeneficiaryScreen: (p0) => const AddBeneficiaryScreen(),

  };
}
