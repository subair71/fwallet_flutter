
import 'package:mpay/core/common/app_array.dart';
import 'package:mpay/core/common/app_fonts.dart';
import 'package:mpay/core/common/languages/app_language.dart';
import 'package:mpay/core/theme/theme_service.dart';
import 'dart:io';
export 'package:mpay/core/common/screen_util/flutter_screen_util.dart';
export 'package:mpay/core/common/theme/index.dart';
export 'package:mpay/core/routes/index.dart';
export 'package:mpay/core/common/extension/spacing.dart';
export 'package:mpay/core/common/extension/widget_extension.dart';
export 'package:mpay/core/widgets/common_button_auth.dart';
export 'package:mpay/core/widgets/common_text.dart';
export 'package:mpay/core/common/assets/index.dart';
export 'package:mpay/core/routes/screen_list.dart';
export 'package:flutter/material.dart';
export 'package:mpay/core/widgets/common_state.dart';
export 'package:mpay/core/widgets/text_form_filed_common.dart';
export 'package:mpay/core/widgets/text_widgets_common.dart';
export 'package:mpay/core/widgets/common_colors.dart';
export 'package:mpay/core/common/extension/text_style_extensions.dart';
export 'package:mpay/core/package_list.dart';
export 'package:mpay/core/models/index.dart';
export 'package:flutter/physics.dart';
export 'core/widgets/common_menu_button.dart';
export 'package:mpay/core/widgets/switch_common.dart';
import 'config.dart';
export 'core/widgets/common_drop_down.dart';
export 'package:mpay/core/widgets/common_curve_clipper_class.dart';
export 'core/widgets/common_menu_widgets.dart';
export 'package:mpay/core/widgets/checkbox_common.dart';
export 'package:mpay/core/widgets/common_button.dart';
export 'package:mpay/core/widgets/common_app_bar.dart';
export 'package:mpay/core/widgets/sign_in_sign_up_rich_text.dart';



AppFonts appFonts = AppFonts();
AppArray appArray = AppArray();
AppCss appCss = AppCss();
AppTheme get appTheme => _appTheme;
AppTheme _appTheme = AppTheme.fromType(ThemeType.light);


ThemeService appColor(context) {
 final  themeServices = Provider.of<ThemeService>(context, listen: false);
  return themeServices;
}


String language(context, text) {
  return AppLocalizations.of(context)!.translate(text);
}

Future<bool> isNetworkConnection() async {
  var connectivityResult = await Connectivity()
      .checkConnectivity(); //Check For Wifi or Mobile data is ON/OFF
  if (connectivityResult == ConnectivityResult.none) {
    return false;
  } else {
    final  result = await InternetAddress.lookup(
        'google.com'); //Check For Internet Connection
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}


