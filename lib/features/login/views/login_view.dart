import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/core/services/auth_with_email_and_password.dart';
import 'package:hotel_app/features/login/cubit/login_cubit.dart';

import 'package:hotel_app/features/login/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(authWithEmailAndPassword: AuthWithEmailAndPassword()),
      child: LoginViewBody(),
    );
  }
}
