import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../config.dart';
import '../bloc/beneficiary_bloc.dart';

class BeneficiaryView extends StatelessWidget {
  const BeneficiaryView({super.key});

  @override
  Widget build(BuildContext context) {
    // Triggering BeneficiaryBloc event on widget initialization
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
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(
                              beneficiary.name,
                              style: AppCss.latoSemiBold14,
                            ),
                            subtitle: Text(
                              'Account',
                              style: AppCss.latoRegular12,
                            ),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              // Handle beneficiary click
                              // Navigator.pushNamed(
                              //   context,
                              //   routeName.beneficiaryDetailScreen,
                              //   arguments: beneficiary,
                              // );
                            },
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

            // Fallback in case no state matches
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
