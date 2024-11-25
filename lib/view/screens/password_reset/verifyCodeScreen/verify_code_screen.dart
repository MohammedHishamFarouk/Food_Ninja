import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/modelView/resetCubit/reset_pass_cubit.dart';
import 'package:food_ninja/view/screens/password_reset/verifyCodeScreen/pin_textfield_widget.dart';

import '../../../../core/components/background_angled_pattern.dart';
import '../../../../core/components/buttons/custom_back_button.dart';
import '../../../../core/components/buttons/green_button_widget.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

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
                        width: 200,
                        child: Text(
                          'Enter 4-digit Verification code',
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
                            'Code sent to +6282045**** . This code will be expired in 01:30',
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
                const SizedBox(
                  height: 30,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Form(
                    child: Row(
                      children: [
                        PinTextFieldWidget(
                          controller:
                              context.read<ResetPassCubit>().controller1,
                        ),
                        PinTextFieldWidget(
                          controller:
                              context.read<ResetPassCubit>().controller2,
                        ),
                        PinTextFieldWidget(
                          controller:
                              context.read<ResetPassCubit>().controller3,
                        ),
                        PinTextFieldWidget(
                          controller:
                              context.read<ResetPassCubit>().controller4,
                        ),
                      ],
                    ),
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
                          context.read<ResetPassCubit>().checkCode(context),
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
