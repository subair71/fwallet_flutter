import 'package:flutter/material.dart';
import 'package:mpay/core/common/extension/widget_extension.dart';
import 'package:mpay/core/common/theme/app_css.dart';
import 'package:mpay/feature/beneficiary/presentation/view/beneficiary_view.dart';
import 'package:mpay/feature/user/presentation/list_layout.dart';
import 'package:mpay/feature/user/presentation/quick_send_layout.dart';


class HomeBodyLayout extends StatelessWidget {
  const HomeBodyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child:  const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // first card  + add Money layout
                  // FirstCardLayout(),
                  // transfer,bill, request, withdraw list layout
                  ListLayout(),
                  // select service layout
                  QuickSendToLayout(),
                  //transaction list layout
                  BeneficiaryView(),
                  // all cards animation layout
               
                ]).paddingOnly(
              bottom: Sizes.s100,
      ),
    );
  }
}
