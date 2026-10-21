import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/core/services/auth_with_email_and_password.dart';
import 'package:hotel_app/features/signUp/cubits/cubit/sign_up_cubit_cubit.dart';
import 'package:hotel_app/features/signUp/widgets/sign_up_view_body.dart';

class SignpView extends StatelessWidget {
  const SignpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubitCubit(AuthWithEmailAndPassword()),
      child: const SignUpViewBody(),
    );
  }
}
