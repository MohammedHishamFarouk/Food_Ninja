import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/backgroundPattterns/background_angled_pattern.dart';
import 'package:food_ninja/core/components/buttons/custom_back_button.dart';
import 'package:food_ninja/core/components/buttons/green_button_widget.dart';

import '../../../core/components/custom_textfield_widget.dart';
import '../../../modelView/userCubit/user_cubit.dart';

class FillBioScreen extends StatelessWidget {
  const FillBioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundAngledPattern(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 11, top: 38),
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
                          'Fill in your bio to get started',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: SizedBox(
                          width: 250,
                          child: Text(
                            'This data will be displayed in your account profile for security',
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
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: CustomTextFieldWidget(
                    hintText: 'First Name',
                    formKey: context.read<UserCubit>().firstNameKey,
                    controller: context.read<UserCubit>().firstName,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: CustomTextFieldWidget(
                    hintText: 'Last Name',
                    formKey: context.read<UserCubit>().lastNameKey,
                    controller: context.read<UserCubit>().lastName,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: CustomTextFieldWidget(
                    hintText: 'Mobile Number',
                    formKey: context.read<UserCubit>().mobileNumberKey,
                    controller: context.read<UserCubit>().mobileNumber,
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
                          Navigator.of(context).pushNamed('paymentMethod'),
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
