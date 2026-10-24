import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/core/colors.dart';
import 'package:hotel_app/core/routs.dart';
import 'package:hotel_app/core/widgets/custom_text_field.dart';
import 'package:hotel_app/core/widgets/login_button.dart';
import 'package:hotel_app/core/widgets/logo_widget.dart';
import 'package:hotel_app/features/signUp/cubits/cubit/sign_up_cubit_cubit.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<SignUpCubitCubit>().signUp(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubitCubit, SignUpCubitState>(
      listener: (context, state) {
        if (state is SignUpCubitSuccess) {
          Navigator.pushReplacementNamed(context, Routes.homeViewRoute);
        } else if (state is SignUpCubitFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final isLoading = state is SignUpCubitLoading;
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
                      'Sign Up',
                      style: TextStyle(
                        color: AppColors.primaryFontColor,
                        fontFamily: 'Playfair Display',
                        fontSize: 26,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Create a Jiva Space Account to \n start discover a bunch of Live \n Spaces waiting for you.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Playfair Display',
                        color: AppColors.primaryFontColor,
                      ),
                    ),
                    SizedBox(height: 40),
                    CustomTextField(
                      hintText: 'example@gmail.com',
                      label: 'Your Email',
                      maxLines: 1,
                      obscureText: false,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.trim().contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      suffixIcon: Icon(Icons.email),
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                      hintText: 'Enter your password',
                      label: 'Password',
                      maxLines: 1,
                      obscureText: !_isPasswordVisible,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                      hintText: ' password',
                      label: 're-Enter your Password',
                      maxLines: 1,
                      obscureText: !_isPasswordVisible,
                      controller: _confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                      ),
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
                            : const Text('Create account'),
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
                            'SignUp with Google',
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
                            'SignUp with Apple',
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
