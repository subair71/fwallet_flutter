import 'package:flutter/gestures.dart';

import '../../config.dart';

class SignInSingUpRichText extends StatelessWidget {
  final String? lightText;
  final String? primaryText;
  final GestureTapCallback? onTap;

  const SignInSingUpRichText(
      {super.key, this.lightText, this.primaryText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: language(context, lightText),
            style: AppCss.latoMedium16
                .textColor(appColor(context).appTheme.lightText)),
        TextSpan(
          recognizer: TapGestureRecognizer()..onTap = onTap,
          text: language(context, " $primaryText"),
          style:
              AppCss.latoMedium16.textColor(appColor(context).appTheme.primary),
        ),
      ]),
    ).center() /*.padding(bottom: Sizes.s10)*/;
  }
}
