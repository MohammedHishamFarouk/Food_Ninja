import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'reset_pass_state.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  ResetPassCubit() : super(ResetPassInitial());

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  final TextEditingController newPassController = TextEditingController();
  final GlobalKey<FormState> newPassKey = GlobalKey();
  final TextEditingController confirmPassController = TextEditingController();
  final GlobalKey<FormState> confirmPassKey = GlobalKey();

  String selectSendWay = '';

  void sendCodeVia(String selectSendWay){
    this.selectSendWay = selectSendWay;
    emit(ResetPassLoadingState());
  }

  void checkChoice(BuildContext context){
    if(selectSendWay == ''){
      emit(ResetPassFailureState());
    }else{
      Navigator.of(context).pushNamed('VerifyCode');
    }
  }

  void checkCode(BuildContext context){
    if(controller1.text+controller2.text+
        controller3.text+controller4.text == '1234'){
      controller1.clear();
      controller2.clear();
      controller3.clear();
      controller4.clear();
      Navigator.of(context).pushReplacementNamed('changePass');
    }
  }

  void checkNewPass(BuildContext context){
    if(newPassController.text == confirmPassController.text &&
        newPassController.text.isNotEmpty &&
        newPassController.text.length >= 8
    ){
      Navigator.of(context).pushReplacementNamed('resetSuccessful');
    }else{
      emit(ResetPassFailureState());
    }
  }

}
