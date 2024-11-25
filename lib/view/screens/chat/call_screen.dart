import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/modelView/chatCubit/chat_cubit.dart';

import '../../../core/components/background_pattern.dart';
import '../../../core/constants/assets.dart';

class CallScreen extends StatelessWidget {
  const CallScreen(
      {super.key, required this.name, required this.image, required this.id});

  final String name;
  final String image;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundPatternWidget(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 2,
                ),
                CircleAvatar(
                  backgroundColor: ColorManager.blendedGreen,
                  radius: 85,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(image),
                    radius: 80,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                const Text(
                  'Ringing. . .',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: FilledButton(
                          onPressed: () =>
                              context.read<ChatCubit>().muteSpeaker(),
                          style: FilledButton.styleFrom(
                            backgroundColor:
                                ColorManager.blendedGreen.withOpacity(0.4),
                          ),
                          child: BlocBuilder<ChatCubit, ChatState>(
                            builder: (context, state) {
                              return Image(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  context.read<ChatCubit>().muted
                                      ? AssetFolder.muteSpeakerIcon
                                      : AssetFolder.speakerIcon,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ClipOval(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: FilledButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: FilledButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: const Image(
                            fit: BoxFit.fill,
                            image: ExactAssetImage(AssetFolder.cancel),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
