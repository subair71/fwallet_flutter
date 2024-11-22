import '../../config.dart';

class CheckBoxCommon extends StatelessWidget {
  final bool? isCheck;
  final GestureTapCallback? onTap;
  const CheckBoxCommon({super.key,this.isCheck = false,this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: Sizes.s20,
        width: Sizes.s20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isCheck == true
                ? appColor(context).appTheme.primary
                : appColor(context).appTheme.gray.withOpacity(0.1),
            borderRadius: BorderRadius.circular(Sizes.s4),
            border: Border.all(color:isCheck == true
                ? appColor(context).appTheme.trans
                : appColor(context).appTheme.trans)),
        child: isCheck == true
            ? Icon(Icons.check,
            size: Sizes.s15,
            color: appColor(context).appTheme.white)
            : null)
        .inkWell(onTap: onTap);
  }
}
