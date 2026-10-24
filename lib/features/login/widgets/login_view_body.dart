import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/core/colors.dart';
import 'package:hotel_app/core/routs.dart';
import 'package:hotel_app/core/widgets/custom_text_field.dart';
import 'package:hotel_app/core/widgets/login_button.dart';
import 'package:hotel_app/core/widgets/logo_widget.dart';
import 'package:hotel_app/features/login/cubit/login_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) return;
    context.read<LoginCubit>().login(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, Routes.homeViewRoute);
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoading;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_sharp, color: AppColors.ringColor),
            ),
          ),
          backgroundColor: AppColors.backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogoWidget(),
                    SizedBox(height: 10),
                    Text(
                      'Log In',
                      style: TextStyle(
                        color: AppColors.primaryFontColor,
                        fontFamily: 'Playfair Display',
                        fontSize: 26,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Enter to a Jiva Space Account to \n start discover a bunch of Live \n Spaces waiting for you.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Playfair Display',
                        color: AppColors.primaryFontColor,
                      ),
                    ),
                    SizedBox(height: 40),
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'example@gmail.com',
                      label: 'Your Email',
                      maxLines: 1,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: Icon(Icons.email),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please Enter Your Email';
                        }
                        if (!value.trim().contains('@')) {
                          return 'Please Enter A valid Email Like example@gmail.com';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Enter your password',
                      label: 'Password',
                      maxLines: 1,
                      obscureText: !_isPasswordVisible,
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please Enter Your Password';
                        }
                        if (value.length < 6) {
                          return 'Please enter at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _submit,
                        child: isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Text('Log in'),
                      ),
                    ),
                    Align(
                      alignment: AlignmentGeometry.topStart,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.forgotPasswordRoute);
                        },
                        child: Text('Forgot Password', style: TextStyle(color: Color(0xffC1C1C1))),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: Divider(thickness: 1, color: AppColors.primaryFontColor)),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('OR', style: TextStyle(color: AppColors.primaryFontColor)),
                        ),
                        Expanded(child: Divider(thickness: 1, color: AppColors.primaryFontColor)),
                      ],
                    ),
                    SizedBox(height: 20),
                    LoginButton(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/google_image.png'),
                          SizedBox(width: 10),
                          Text(
                            'Login with Google',
                            style: TextStyle(color: AppColors.primaryFontColor),
                          ),
                        ],
                      ),
                      routeName: Routes.homeViewRoute,
                    ),
                    SizedBox(height: 8),
                    LoginButton(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/apple_image.png'),
                          SizedBox(width: 10),
                          Text(
                            'Login with Apple',
                            style: TextStyle(color: AppColors.primaryFontColor),
                          ),
                        ],
                      ),
                      routeName: Routes.homeViewRoute,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
