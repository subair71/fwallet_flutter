import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpay/config.dart';
import 'package:mpay/feature/topup/presentation/bloc/top_up_bloc.dart';
import 'package:mpay/feature/topup/presentation/bloc/top_up_state.dart';


class PayWidget {
 
  Widget amountLayout(Function(int, String) updateAmount) {
  return BlocBuilder<TopUpBloc, TopUpState>(
    builder: (context, state) {

      if (state is TopUpLoaded) {
        return Center(
          child: Wrap(
            spacing: Sizes.s8, // Horizontal spacing between widgets
            runSpacing: Sizes.s8,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: state.options.asMap().entries.map((entry) {
              var amount = entry.value;
              var index = entry.key;
          
              return Chip(
                backgroundColor:  appTheme.primary.withOpacity(0.2),
                
                // padding: EdgeInsets.only(left: Sizes.s12, right: Sizes.s12),
                label: TextWidgetCommon(
                            text:
                                "AED $amount",
                            style: AppCss.latoMedium12
                                .textColor(appColor(context).appTheme.primary)))
                    // .center()
                    // .height(Sizes.s28)
                    // .decorated(
                    //     color: appTheme.primary.withOpacity(0.2),
                    //     borderRadius:
                    //         SmoothBorderRadius(cornerRadius: AppRadius.r20))
                    .inkWell(onTap: () => updateAmount(index, amount.toString()))
                    .padding(top: Sizes.s12, right: Sizes.s10);
              }).toList(),
          ),
        );
      }

      return const Center(child:SizedBox());
    },
  );
}

  // transfer($19.99) text layout
  Widget transferButton(context, {onTap}) {
    return CommonAuthButton(
      text: appFonts.transferButton,
    ).inkWell(onTap: onTap);
  }
}
