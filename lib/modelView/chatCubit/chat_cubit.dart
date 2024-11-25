import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_ninja/model/message_model.dart';
import 'package:food_ninja/view/screens/chat/chatingScreen/message_widget.dart';

import 'package:food_ninja/core/style/color_manager.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  GlobalKey<FormState> chatFieldKey = GlobalKey();

  TextEditingController chatFieldController = TextEditingController();
  bool muted = false;

  List<MessageModel> messageModelList = [
    MessageModel(id: 0, received: true, message: 'hallo'),
    MessageModel(id: 0, received: true, message: 'its me'),
    MessageModel(
        id: 0, received: false, message: 'Fortnite is an online video game'),
  ];

  void sendMessage(int id){
    if(chatFieldController.text.isNotEmpty){
      messageModelList.add(
          MessageModel(
            id: id,
            received: false,
            message: chatFieldController.text,
          )
      );
    }
    chatFieldController.clear();
  }

  List<Widget> displayMessages(int id) {
    emit(ChatLoadingState());
    List<Widget> messagesToDisplay = [];
    for (var m in messageModelList) {
      if (m.id == id) {
        if (m.received) {
          messagesToDisplay.add(
            Align(
              alignment: Alignment.topLeft,
              child: MessageWidget(
                message: m.message,
                gradient: ColorManager.greyGradient,
              ),
            ),
          );
        } else {
          messagesToDisplay.add(
            Align(
              alignment: Alignment.topRight,
              child: MessageWidget(
                message: m.message,
                gradient: ColorManager.greenGradient,
              ),
            ),
          );
        }
      }
    }
    emit(ChatSuccessState());
    return messagesToDisplay;
  }

  void muteSpeaker(){
    muted = !muted;
    emit(SpeakerMuteState());
  }

}
