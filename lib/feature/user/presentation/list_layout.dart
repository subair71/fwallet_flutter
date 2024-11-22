

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mpay/core/common/app_array.dart';
import 'package:mpay/core/common/extension/widget_extension.dart';
import 'package:mpay/core/common/theme/app_css.dart';


// transfer,bill, request, withdraw list layout
class ListLayout extends StatelessWidget {
  const ListLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: AppArray().optionList.asMap().entries.map((entries) {
              var e = entries.value;
              var index = entries.key;
              return Column(children: [
                Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      SvgPicture.asset("${e["icon"]}",
                          height: Sizes.s28,
                          width: Sizes.s28,
                          fit: BoxFit.fill)
                    ])
                    .inkWell(
                        onTap: () {})
                    .marginOnly(top: Sizes.s15),
                // TextWidgetCommon(
                //         text: "${e["title"]}",
                //         style: AppCss.latoMedium14
                //             .textColor(appColor(context).appTheme.darkText))
                //     .marginOnly(bottom: Sizes.s15, top: Sizes.s8)
              ]);
            }).toList())
        .backgroundColor(Colors.blue);
  }
}
