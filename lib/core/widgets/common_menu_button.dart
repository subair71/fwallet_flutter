import 'package:mpay/config.dart';

class CommonMenuButton extends StatelessWidget {
  final IconData? icon;
  final bool? isIcon;
  final bool? isBorder;
  final Color? color;
  final Color? iconColor;
  final ColorFilter? colorFilter;
  final BoxBorder? border;
  final String? iconImage;

  const CommonMenuButton(
      {super.key,
      this.icon,
      this.isIcon,
      this.color,
      this.iconColor,
      this.border,
      this.isBorder,
      this.iconImage,
      this.colorFilter});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.all(Insets.i8),
            decoration: BoxDecoration(
                color: color ?? appColor(context).appTheme.menuButtonColor,
                border: Border.all(
                    color: appColor(context).appTheme.radioGrayColor),
                borderRadius: SmoothBorderRadius(cornerRadius: Sizes.s6)),
            child: isIcon == true
                ? Icon(icon!,
                        size: Sizes.s18,
                        color: iconColor ?? appColor(context).appTheme.darkText)
                    .center()
                : SvgPicture.asset(iconImage ?? eSvgAssets.bell,
                    fit: BoxFit.fill,
                    colorFilter: colorFilter));
  }
}
