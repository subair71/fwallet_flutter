
import 'package:mpay/config.dart';

class CommonText extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final double? vertical;
  final double? horizontal;
  const CommonText({super.key, this.text, this.textColor, this.vertical, this.horizontal});

  @override
  Widget build(BuildContext context) {
    return  Text(
      textAlign: TextAlign.center,
      language(context, "$text")  ,
      style: AppCss.latoRegular14
          .textColor(textColor??appTheme.lightText)
          .textHeight(Sizes.s1),
    ).paddingSymmetric(
        vertical: vertical??Sizes.s1 , horizontal: horizontal??Sizes.s1);
  }
}
