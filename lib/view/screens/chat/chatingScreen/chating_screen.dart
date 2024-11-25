import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/background_pattern.dart';
import 'package:food_ninja/core/components/buttons/custom_back_button.dart';
import 'package:food_ninja/core/components/custom_textfield_widget.dart';
import 'package:food_ninja/core/constants/assets.dart';
import 'package:food_ninja/modelView/chatCubit/chat_cubit.dart';
import 'package:food_ninja/view/screens/chat/component/contact_button.dart';

class ChatingScreen extends StatelessWidget {
  const ChatingScreen(
      {super.key, required this.image, required this.name, required this.id});

  final String image;
  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundPatternWidget(),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, top: 38, right: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: CustomBackButton(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 8),
                  child: Text(
                    'Chat',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ContactButton(
                  image: image,
                  name: name,
                  addButtons: true,
                  status: 'Online',
                  id: id,
                ),
                BlocBuilder<ChatCubit, ChatState>(
                  builder: (context, state) {
                    List<Widget> messages =
                        context.read<ChatCubit>().displayMessages(id);
                    return Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return messages[index];
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: messages.length,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 70,
                  child: CustomTextFieldWidget(
                    hintText: 'start Typing . .',
                    formKey: context.read<ChatCubit>().chatFieldKey,
                    controller: context.read<ChatCubit>().chatFieldController,
                    addSuffixIcon: true,
                    suffixIcon: const Image(
                      image: AssetImage(AssetFolder.sendIcon),
                    ),
                    onSuffixTapped: () {
                      context.read<ChatCubit>().sendMessage(id);
                      context.read<ChatCubit>().displayMessages(id);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
