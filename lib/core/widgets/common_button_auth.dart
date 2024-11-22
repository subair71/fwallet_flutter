import '../../config.dart';

class CommonAuthButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? left;
  final double? bottom;
  final double? right;
  final Color? color;
  final Color? textColor;
  final String? text;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Gradient? gradient;
  final GestureTapCallback? onTap;

  const CommonAuthButton(
      {super.key,
      this.height,
      this.width,
      this.color,
      this.text,
      this.textColor,
      this.margin,
      this.borderRadius,
      this.gradient,
      this.left,
      this.right,
      this.bottom, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: height ?? Sizes.s46,
          margin: margin ??
              EdgeInsets.only(
                  left: left ?? 0, right: right ?? 0, bottom: bottom ?? 0),
          decoration: BoxDecoration(
              gradient: gradient ??
                  gradientColor(context,
                      begin: Alignment.bottomCenter, end: Alignment.topCenter),
              borderRadius:
                  borderRadius ?? SmoothBorderRadius(cornerRadius: Sizes.s8),
              color: color),
          child: TextWidgetCommon(
                  text: text!,
                  style: AppCss.latoSemiBold16
                      .textColor(textColor ?? appColor(context).appTheme.white))
              .center(),
        ).inkWell(onTap: onTap)),
      ],
    );
  }
}
