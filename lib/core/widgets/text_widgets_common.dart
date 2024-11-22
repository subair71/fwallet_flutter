

import 'package:mpay/config.dart';

class TextWidgetCommon extends StatelessWidget {
  const TextWidgetCommon(
      {super.key, this.text, this.textAlign, this.style, this.color,this.overflow});

  final String? text;
  final TextAlign? textAlign;
  final TextStyle? style;
  final Color? color;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(overflow: overflow,
      language(context, text??""),
      textAlign: textAlign ?? TextAlign.start,
      style: style ??
          AppCss.latoMedium16
              .textColor(color ?? appColor(context).appTheme.darkText).textHeight(1.2).textDecoration(TextDecoration.none),
    );
  }
}
