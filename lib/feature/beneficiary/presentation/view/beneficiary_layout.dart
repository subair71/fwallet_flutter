// import 'dart:math';

// import 'package:mpay/feature/beneficiary/domain/entity/beneficiaru_entity.dart';

// import '../../../../../../../config.dart';

// //Transaction icon,title, subtitle,price, time layout
// class BeneficiaryLayout extends StatelessWidget {
//   final Beneficiary? data;

//   const BeneficiaryLayout({super.key, this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//       Row(children: [
//        Icon(
//   IconData(0xe491, fontFamily: 'MaterialIcons'), // Replace with your desired IconData
//   size: Sizes.s26, // Set the size of the icon
//   color: appColor(context).appTheme.darkText, // Set the icon color
// )
//     .selectExtension(context)
//     .paddingSymmetric(vertical: Sizes.s15, horizontal: Sizes.s15),

//         Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextWidgetCommon(text: data?.name??''). padding(bottom: Sizes.s6),
//               TextWidgetCommon(
//                   text: data?.nickname??'',
//                   style: AppCss.latoMedium14
//                       .textColor(appColor(context).appTheme.lightText))
//             ])
//       ]),
//       Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             TextWidgetCommon(
//                 text:generateRandomTime(),
//                 style: AppCss.latoMedium14.textColor(appTheme.lightText))
//           ]).paddingSymmetric(horizontal: Sizes.s15)
//     ]).transactionExtension(context: context);
//   }

//   String generateRandomTime() {
//   final random = Random();
//   // Generate random hour between 00 and 23
//   final hour = random.nextInt(24).toString().padLeft(2, '0');
//   // Generate random minute between 00 and 59
//   final minute = random.nextInt(60).toString().padLeft(2, '0');
//   // Combine hour and minute in HHmm format
//   return '$hour$minute';
// }
// }
