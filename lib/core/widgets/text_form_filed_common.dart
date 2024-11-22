import '../../config.dart';

class TextFiledCommon extends StatelessWidget {
  final  GestureTapCallback? onTap;
  final BorderRadius? borderRadius;
  final BorderRadius? enabledBorder;
  final BorderSide? borderSide;
  final String? hintText;
  final Color? color;
  final double? width;
  final String? imageIcon;
  final TextEditingController? controller;
  final TextStyle? style;
  final IconButton? icon;
  final bool? isIcon;
  final bool? isPerFixIcon;
  final FormFieldValidator? validator;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool obscureText;
  final FormFieldSetter? onSaved;
  final bool readOnly;

  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines = 1;

  const TextFiledCommon(
      {super.key,
      this.onTap,
      this.borderRadius,
      this.borderSide,
      this.enabledBorder,
      this.hintText,
      this.color,
      this.width,
      this.controller,
      this.style,
      this.icon,
      this.isIcon,
      this.validator,
      this.keyboardType,
      this.maxLength,
      this.obscureText = false,
      this.readOnly = false,
      this.onSaved,
      this.onChanged,
      this.imageIcon,
      this.prefixIcon,
      this.isPerFixIcon = false,
      this.suffixIcon,
      this.focusNode,
      this.contentPadding});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      readOnly: readOnly,
      cursorOpacityAnimates: false,
      focusNode: focusNode,
      style: AppCss.latoRegular14,
      scrollPadding: EdgeInsets.zero,
      validator: validator,
      keyboardType: keyboardType,
      maxLength: maxLength,
      controller: controller,
      obscureText: obscureText,
      minLines: 1,
      maxLines: maxLines ?? 1,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(isDense: true,
        filled: true,
        contentPadding:
            contentPadding ?? EdgeInsets.symmetric(horizontal: Sizes.s15),
        focusedBorder: OutlineInputBorder(
            borderRadius:
                borderRadius ?? SmoothBorderRadius(cornerRadius: Sizes.s6),
            borderSide: borderSide ??
                BorderSide(
                    width: 2,
                    color: color ?? appColor(context).appTheme.trans)),
        fillColor: color ?? appColor(context).appTheme.gray.withOpacity(0.1),
        border: OutlineInputBorder(
            borderRadius:
                borderRadius ?? SmoothBorderRadius(cornerRadius: Sizes.s6),
            borderSide: borderSide ??
                BorderSide(
                    color: appColor(context).appTheme.trans, width: Sizes.s2)),
        hintText: language(context, hintText),
        hintStyle: style ??
            AppCss.latoMedium14
                .textColor(color ?? appColor(context).appTheme.lightText),
        enabledBorder: OutlineInputBorder(
            borderRadius:
                enabledBorder ?? SmoothBorderRadius(cornerRadius: Sizes.s6),
            borderSide: BorderSide(
                width: Sizes.s2, color: appColor(context).appTheme.trans)),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon ??
            (isIcon == true
                ? icon
                : SvgPicture.asset("$imageIcon",
                    fit: BoxFit.scaleDown,
                    height: Sizes.s24,
                    width: Sizes.s24)),
      ),
    );
  }
}
