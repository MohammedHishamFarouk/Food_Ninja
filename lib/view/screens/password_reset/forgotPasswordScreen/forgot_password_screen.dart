import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/modelView/resetCubit/reset_pass_cubit.dart';
import 'package:food_ninja/view/screens/password_reset/forgotPasswordScreen/code_via_button.dart';

import '../../../../core/components/background_angled_pattern.dart';
import '../../../../core/components/buttons/custom_back_button.dart';
import '../../../../core/components/buttons/green_button_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundAngledPattern(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 5, top: 38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBackButton(),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: SizedBox(
                          width: 230,
                          child: Text(
                            'Select which contact details should we use to reset your password',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CodeViaButton(
                  title: 'email',
                  subTitle: '****@gmail.com',
                  leading: Icon(
                    Icons.mail_rounded,
                    color: ColorManager.blendedGreen,
                    size: 40,
                  ),
                  onPressed: () =>
                      context.read<ResetPassCubit>().sendCodeVia('email'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CodeViaButton(
                    title: 'sms',
                    subTitle: '**** **** 4523',
                    leading: Icon(
                      Icons.chat,
                      color: ColorManager.blendedGreen,
                      size: 40,
                    ),
                    onPressed: () =>
                        context.read<ResetPassCubit>().sendCodeVia('sms'),
                  ),
                ),
                const Spacer(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100.0),
                    child: GreenButtonWidget(
                      text: 'Next',
                      height: 60,
                      width: 160,
                      onTap: () =>
                          context.read<ResetPassCubit>().checkChoice(context),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
