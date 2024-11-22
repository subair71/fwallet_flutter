import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpay/feature/beneficiary/presentation/bloc/beneficiary_bloc.dart';
import '../../../../../../../config.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BeneficiaryBloc>(context).add(
      GetAllBeneficiariesEvent(userId: 'user123'),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beneficiaries'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<BeneficiaryBloc, BeneficiaryState>(
          builder: (context, state) {
            if (state is BeneficiaryLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is BeneficiaryError) {
              return Center(
                child: Text(
                  state.message,
                  style: AppCss.latoSemiBold16.copyWith(
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }

            if (state is AllBeneficiariesLoaded) {
              final beneficiaries = state.beneficiaries;

              return beneficiaries.isNotEmpty
                  ? ListView.separated(
                      itemCount: beneficiaries.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final beneficiary = beneficiaries[index];
                        return Card(
                          elevation: 2,
                          margin: EdgeInsets.zero,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  beneficiary.name,
                                  style: AppCss.latoSemiBold14,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Account',
                                  style: AppCss.latoRegular12,
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigator.pushNamed(
                                    //   context,
                                    //   routeName.transactionScreen,
                                    //   arguments: beneficiary,
                                    // );
                                  },
                                  child: const Text('Transfer Money'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        "No beneficiaries found.",
                        style: AppCss.latoRegular14.copyWith(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
