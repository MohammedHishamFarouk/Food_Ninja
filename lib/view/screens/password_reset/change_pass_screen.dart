import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/custom_textfield_widget.dart';
import 'package:food_ninja/modelView/resetPassCubit/reset_pass_cubit.dart';

import '../../../core/components/backgroundPattterns/background_angled_pattern.dart';
import '../../../core/components/buttons/custom_back_button.dart';
import '../../../core/components/buttons/green_button_widget.dart';

class ChangePassScreen extends StatelessWidget {
  const ChangePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPassCubit, ResetPassState>(
      listener: (context, state) {
        if (state is ResetPassFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'please make sure the password is at least 8 char and not empty'),
            ),
          );
        }
      },
      child: Scaffold(
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
                          width: 250,
                          child: Text(
                            'Reset your password here',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: CustomTextFieldWidget(
                      hintText: 'New Password',
                      formKey: context.read<ResetPassCubit>().newPassKey,
                      controller:
                          context.read<ResetPassCubit>().newPassController,
                    ),
                  ),
                  CustomTextFieldWidget(
                    hintText: 'Confirm Password',
                    formKey: context.read<ResetPassCubit>().confirmPassKey,
                    controller:
                        context.read<ResetPassCubit>().confirmPassController,
                  ),
                  const Spacer(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 100.0),
                      child: GreenButtonWidget(
                        text: 'Next',
                        height: 60,
                        width: 160,
                        onTap: () => context
                            .read<ResetPassCubit>()
                            .checkNewPass(context),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
