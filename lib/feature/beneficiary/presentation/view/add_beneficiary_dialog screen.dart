import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpay/feature/beneficiary/domain/entity/beneficiary_params.dart';
import 'package:mpay/feature/beneficiary/presentation/bloc/beneficiary_bloc.dart';

import '../../../../config.dart';

class AddBeneficiaryScreen extends StatefulWidget {
  const AddBeneficiaryScreen({super.key});

  @override
  State<AddBeneficiaryScreen> createState() => _AddBeneficiaryScreenState();
}

class _AddBeneficiaryScreenState extends State<AddBeneficiaryScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _nickNameController.dispose();
    super.dispose();
  }

  void _onAddBeneficiary(BuildContext context) {
    final fullName = _fullNameController.text.trim();
    final nickName = _nickNameController.text.trim();

    if (fullName.isEmpty || nickName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Both fields are required')),
      );
      return;
    }

    context.read<BeneficiaryBloc>().add(
          CheckBeneficiaryEvent(
            params: BeneficiaryParams(
              name: fullName,
              nickname: nickName,
              userId: 'user123', // Replace with actual user ID
            ),
          ),
        );
  }

 void _showErrorSnackBar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage),
      backgroundColor: appTheme.primary,
      duration: const Duration(seconds: 3),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor(context).appTheme.screenBg,
      appBar: CommonAppBar(
        onTap: () => Navigator.pop(context),
        isSetting: false,
        title: appFonts.addBeneficiary,
      ),
      body: BlocConsumer<BeneficiaryBloc, BeneficiaryState>(
        listener: (context, state) {
          if (state is BeneficiaryError) {
            _showErrorSnackBar(context, state.message);
          } else if (state is BeneficiaryAdded) {
            // Pop the screen if the addition was successful
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(Sizes.s20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidgetCommon(
                  text: appFonts.fullName,
                ).padding(bottom: Sizes.s10),
                TextFiledCommon(
                  controller: _fullNameController,
                  keyboardType: TextInputType.text,
                  hintText: appFonts.fullName,
                  style: AppCss.latoMedium14
                      .textColor(appColor(context).appTheme.lightText),
                ).padding(bottom: Sizes.s20),
                TextWidgetCommon(
                  text: appFonts.nickName,
                  style: AppCss.latoLight16
                      .textColor(appColor(context).appTheme.darkText),
                ).padding(bottom: Sizes.s10),
                TextFiledCommon(
                  controller: _nickNameController,
                  keyboardType: TextInputType.text,
                  hintText: appFonts.nickName,
                  style: AppCss.latoMedium14
                      .textColor(appColor(context).appTheme.lightText),
                ).padding(bottom: Sizes.s30),
                CommonAuthButton(
                  text: appFonts.add,
                ).inkWell(onTap: () => _onAddBeneficiary(context)),
               
              ],
            ),
          );
        },
      ),
    );
  }
}
