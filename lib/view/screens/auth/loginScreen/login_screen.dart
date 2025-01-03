import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/backgroundPattterns/background_pattern.dart';
import 'package:food_ninja/core/components/buttons/green_button_widget.dart';
import 'package:food_ninja/core/components/custom_textfield_widget.dart';
import 'package:food_ninja/core/components/password_textfield_widget.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/view/screens/auth/loginScreen/sign_options_button.dart';

import '../../../../modelView/userCubit/user_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.of(context).pushNamed('');
        } else if (state is LoginFailure) {
          log(state.message);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    const BackGroundPatternWidget(),
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Image.asset('assets/Logo.png'),
                          ),
                          Text(
                            'FoodNinja',
                            style: TextStyle(
                                fontSize: 35, color: ColorManager.blendedGreen),
                          ),
                          const Text(
                            'Deliver Favourite Food',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Text(
                  'Login To Your Account',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 15,
                  ),
                  child: Column(
                    children: [
                      CustomTextFieldWidget(
                        hintText: 'Email',
                        formKey: context.read<UserCubit>().signInEmailKey,
                        controller: context.read<UserCubit>().signInEmail,
                      ),
                      const SizedBox(height: 12),
                      PassTextFieldWidget(
                        hintText: 'Password',
                        formKey: context.read<UserCubit>().signInPasswordKey,
                        controller: context.read<UserCubit>().signInPassword,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 22.0),
                        child: Text(
                          'Or Continue with',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SignOptionsButton(
                            image: 'assets/sign_up/facebook-3 1.png',
                            text: 'Facebook',
                          ),
                          SignOptionsButton(
                            image: 'assets/sign_up/google-icon 1.png',
                            text: 'Google',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed('forgotPassword'),
                        child: const Text('Forgot Your Password?'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GreenButtonWidget(
                    text: 'Login',
                    height: 60,
                    width: 160,
                    onTap: () => context.read<UserCubit>().login(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Account?",
                      style: TextStyle(fontSize: 12),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<UserCubit>().clearFields();
                        Navigator.of(context).pushReplacementNamed('signUp');
                      },
                      child: const Text('Sign up'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
