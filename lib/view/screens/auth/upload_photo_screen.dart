import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/constants/assets.dart';
import 'package:food_ninja/modelView/userCubit/user_cubit.dart';

import '../../../core/components/backgroundPattterns/background_angled_pattern.dart';
import '../../../core/components/buttons/custom_back_button.dart';
import '../../../core/components/buttons/custom_filled_button.dart';
import '../../../core/components/buttons/custom_icon_button.dart';
import '../../../core/components/buttons/green_button_widget.dart';

class UploadPhotoScreen extends StatelessWidget {
  const UploadPhotoScreen({super.key});

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
                          'Upload Your Profile Photo',
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
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    return context.read<UserCubit>().profileImage == null
                        ? Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Center(
                                  child: CustomFilledButton(
                                    image: AssetFolder.gallery,
                                    onPressed: () => context
                                        .read<UserCubit>()
                                        .pickImageFromGallery(),
                                    imageScale: 0.9,
                                    text: 'From Gallery',
                                    height: 150,
                                  ),
                                ),
                              ),
                              Center(
                                child: CustomFilledButton(
                                  image: AssetFolder.camera,
                                  onPressed: () => context
                                      .read<UserCubit>()
                                      .pickImageFromCamera(),
                                  imageScale: 0.8,
                                  height: 150,
                                  text: 'Take Photo',
                                ),
                              ),
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 65.0),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width -
                                          130,
                                      height: MediaQuery.sizeOf(context).width -
                                          130,
                                      child: Image.file(
                                        File(context
                                            .read<UserCubit>()
                                            .profileImage!
                                            .path),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 45),
                                  child: CustomIconButton(
                                    onPressed: () =>
                                        context.read<UserCubit>().cancelImage(),
                                    icon: Icons.cancel_outlined,
                                    backgroundColor: Colors.white,
                                    iconColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                  },
                ),
                const Spacer(
                  flex: 4,
                ),
                Center(
                  child: GreenButtonWidget(
                    text: 'Next',
                    height: 60,
                    width: 160,
                    onTap: () => Navigator.of(context).pushNamed('setLocation'),
                  ),
                ),
                const Spacer()
              ],
            ),
          )
        ],
      ),
    );
  }
}
