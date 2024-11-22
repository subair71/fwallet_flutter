import '../../config.dart';

class CommonDropDownMenu extends StatelessWidget {
  final List<DropdownMenuItem<dynamic>>? itemsList; // Change type
  final String? hintText; // to dynamic
  final dynamic value;
  final ValueChanged? onChanged;
  final BorderRadiusGeometry? borderRadius;
  final Widget? underline;

  const CommonDropDownMenu(
      {super.key,
      this.itemsList,
      this.hintText,
      this.onChanged,
      this.value, this.borderRadius, this.underline}); // Change type to dynamic

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: Sizes.s10),
              decoration: BoxDecoration(
                  color: appColor(context).appTheme.gray.withOpacity(0.1),
                  borderRadius:borderRadius?? SmoothBorderRadius(cornerRadius: Sizes.s8)),
              child: DropdownButton(
                  // Change type to dynamic
                  dropdownColor: appColor(context).appTheme.menuButtonColor,
                  isExpanded: true,
                  icon: Icon(Icons.keyboard_arrow_down_outlined,
                      color: appColor(context).appTheme.gray.withOpacity(0.5)),
                  value: value,
                  items: itemsList,
                  underline:underline?? const SizedBox.shrink(),
                  onChanged: onChanged,
                  hint: TextWidgetCommon(
                      text: language(context, hintText),
                      style: AppCss.latoMedium14
                          .textColor(appColor(context).appTheme.lightText)))))
    ]);
  }
}
