import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/backgroundPattterns/background_pattern.dart';
import 'package:food_ninja/core/components/buttons/green_button_widget.dart';
import 'package:food_ninja/core/components/custom_textfield_widget.dart';
import 'package:food_ninja/core/constants/assets.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/modelView/userCubit/user_cubit.dart';

import 'signup_icon_buttons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.of(context).pushNamed('fillBio');
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
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
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Image.asset(AssetFolder.logo),
                            ),
                            Text(
                              'FoodNinja',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: ColorManager.blendedGreen),
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
                    'Sign Up For Free',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        CustomTextFieldWidget(
                          hintText: 'Anamwp . .',
                          prefixImage: 'assets/sign_up/Profile.png',
                          formKey: context.read<UserCubit>().signUpAnamwpKey,
                          controller: context.read<UserCubit>().signUpAnamwp,
                          addPrefix: true,
                        ),
                        const SizedBox(height: 12),
                        CustomTextFieldWidget(
                          hintText: 'Email',
                          prefixImage: 'assets/sign_up/Message.png',
                          formKey: context.read<UserCubit>().signUpEmailKey,
                          controller: context.read<UserCubit>().signUpEmail,
                          addPrefix: true,
                        ),
                        const SizedBox(height: 12),
                        CustomTextFieldWidget(
                          hintText: 'Password',
                          prefixImage: 'assets/sign_up/Lock.png',
                          formKey: context.read<UserCubit>().signUpPasswordKey,
                          controller: context.read<UserCubit>().signUpPassword,
                          addPrefix: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SignUpIconButtons(
                          text: 'Keep Me Signed In',
                          changeIcon: context.read<UserCubit>().keepMeSigned,
                          onPressed: () {
                            context.read<UserCubit>().keepMeSignedPressed();
                          },
                        ),
                        SignUpIconButtons(
                          text: 'Email Me About Special Pricing',
                          changeIcon:
                              context.read<UserCubit>().emailSpecialPricing,
                          onPressed: () {
                            context
                                .read<UserCubit>()
                                .emailSpecialPricingPressed();
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: state is SignUpLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: ColorManager.blendedGreen,
                            ),
                          )
                        : GreenButtonWidget(
                            text: 'Create Account',
                            height: 60,
                            width: 180,
                            onTap: () {
                              context.read<UserCubit>().signUp();
                            },
                          ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('login');
                    },
                    child: const Text(
                      'already have an Account?',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
