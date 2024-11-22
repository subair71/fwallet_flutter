import '../../config.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GestureTapCallback? onTap;
  final GestureTapCallback? settingTap;
  final GestureTapCallback? imageIconTap;
  final String? title;
  final String? isImageIcon;
  final bool? isSetting;
  final bool? isImageIconSvg;
  final bool? centerTitle;
  final Widget? titleWidget;
  final Color? bgColor;

  const CommonAppBar(
      {super.key,
      this.onTap,
      this.title,
      this.isSetting,
      this.settingTap,
      this.isImageIconSvg,
      this.isImageIcon,
      this.imageIconTap,
      this.titleWidget,
      this.centerTitle,
      this.bgColor});

  @override
  Widget build(BuildContext context) {
    return 
       AppBar(
          elevation: 0,
          backgroundColor: bgColor ?? appColor(context).appTheme.screenBg,
          centerTitle: centerTitle ?? true,
          titleSpacing: 0,
          leadingWidth: Sizes.s80,
          leading: CommonMenuButton(
                  isIcon: false,
                  iconImage: eSvgAssets.arrowLeft,
                  colorFilter: ColorFilter.mode(
                      appColor(context).appTheme.darkText, BlendMode.srcIn))
              .inkWell(onTap: onTap)
              .padding(all: 8.5, horizontal: Insets.i22),
          title: titleWidget ??
              TextWidgetCommon(
                  text: language(context, title),
                  style: AppCss.latoSemiBold22
                      .textColor(appColor(context).appTheme.darkText)),
          actions: [
            isSetting == true
                ? CommonMenuButton(
                        isIcon: false,
                        iconImage: eSvgAssets.settings,
                        colorFilter: ColorFilter.mode(
                            appColor(context).appTheme.darkText,
                            BlendMode.srcIn))
                    .inkWell(onTap: settingTap).height(Sizes.s36).width(Sizes.s36)
                    .padding(horizontal: Sizes.s20)
                : isImageIconSvg == true
                    ? CommonMenuButton(
                            isIcon: false,
                            iconImage: isImageIcon ?? eSvgAssets.trash,
                            colorFilter: ColorFilter.mode(
                                appColor(context).appTheme.darkText,
                                BlendMode.srcIn))
                        .inkWell(onTap: imageIconTap).height(Sizes.s36).width(Sizes.s36)
                        .padding(horizontal: Sizes.s20)
                    : const SizedBox.shrink()
          ])
    ;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
