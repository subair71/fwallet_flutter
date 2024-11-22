import 'package:mpay/core/common/app_fonts.dart';
import 'package:mpay/config.dart';

//quick send money layout
class QuickSendToLayout extends StatelessWidget {
  const QuickSendToLayout({super.key});

  @override
  Widget build(BuildContext context) {
     var quickSend = [
    {
      "title": AppFonts().add,
      "icon": eImageAssets.firstQuick,
    },
    {
      "title":  AppFonts().connie,
      "icon": eImageAssets.secQuick,
    },
    {
      "title":  AppFonts().kristin,
      "icon": eImageAssets.thirdQuick,
    },
    {
      "title":  AppFonts().courtney,
      "icon": eImageAssets.fourthQuick,
    },
    {
      "title":  AppFonts().dianne,
      "icon": eImageAssets.secQuick,
    },
  ];
    
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // quick send heading text
        TextWidgetCommon(text: appFonts.quickSend, style: AppCss.latoSemiBold18.textColor(appColor(context).appTheme.darkText))
            .padding(horizontal: Sizes.s10,bottom: Sizes.s18,top: Sizes.s18 ),
        // quick send icon and text list layout
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: quickSend.asMap().entries.map((entry) {
                  final index = entry.key;
                  final e = entry.value;
                  return Column(children: [
                    Stack(children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image.asset("${e["icon"]}", fit: BoxFit.fill)
                          ])
                    ]).width(Sizes.s70).marginOnly(
                        left:Sizes.s10,

                        right: Sizes.s0),
                    TextWidgetCommon(
                        text: e["title"],
                        style: AppCss.latoMedium14
                            .textColor(appColor(context).appTheme.darkText))
                        .marginOnly(top: Sizes.s5)
                  ]);
                }).toList()))
      ]).paddingSymmetric(horizontal: Sizes.s10);
    
  }
}
