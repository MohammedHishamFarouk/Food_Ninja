import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  GlobalKey<FormState> signUpAnamwpKey = GlobalKey();

  TextEditingController signUpAnamwp = TextEditingController();

  GlobalKey<FormState> signUpPasswordKey = GlobalKey();

  TextEditingController signUpPassword = TextEditingController();

  GlobalKey<FormState> signUpEmailKey = GlobalKey();

  TextEditingController signUpEmail = TextEditingController();

  GlobalKey<FormState> signInPasswordKey = GlobalKey();

  TextEditingController signInPassword = TextEditingController();

  GlobalKey<FormState> signInEmailKey = GlobalKey();

  TextEditingController signInEmail = TextEditingController();

  GlobalKey<FormState> firstNameKey = GlobalKey();

  TextEditingController firstName = TextEditingController();

  GlobalKey<FormState> lastNameKey = GlobalKey();

  TextEditingController lastName = TextEditingController();

  GlobalKey<FormState> mobileNumberKey = GlobalKey();

  TextEditingController mobileNumber = TextEditingController();

  XFile? profileImage;


  bool keepMeSigned = false;
  bool emailSpecialPricing = false;

  void signUp(){
    emit(SignUpLoading());
    if(signUpAnamwp.text.isEmpty || signUpEmail.text.isEmpty || signUpPassword.text.isEmpty){
      emit(SignUpFailure(message: 'Please Fill in the required Fields'));
      return;
    }
    emit(SignUpSuccess());
  }

  void keepMeSignedPressed(){
    keepMeSigned = !keepMeSigned;
    emit(IconButtonPressed());
  }

  void emailSpecialPricingPressed(){
    emailSpecialPricing = !emailSpecialPricing;
    emit(IconButtonPressed());
  }

  Future pickImageFromGallery()async{
   profileImage = await ImagePicker().pickImage(source: ImageSource.gallery);
   emit(ChangeProfileImage());
  }

  Future pickImageFromCamera()async{
    profileImage = await ImagePicker().pickImage(source: ImageSource.camera);
    emit(ChangeProfileImage());
  }

  void cancelImage(){
    profileImage = null;
    emit(ChangeProfileImage());
  }

}
