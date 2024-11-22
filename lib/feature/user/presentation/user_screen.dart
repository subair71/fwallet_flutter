import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpay/feature/user/presentation/bloc/user_bloc.dart';
import 'package:mpay/feature/user/presentation/bloc/user_state.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Details (BlocBuilder)")),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            final user = state.user;
            return Center(
              child: Text(
                "ID: ${user.id}, Balance: ${user.balance}, Verified: ${user.isVerified}",
              ),
            );
          } else if (state is UserError) {
            return Center(child: Text("Error: ${state.message}"));
          } else {
            return const Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
