import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_ninja/core/api/api_consumer.dart';
import 'package:food_ninja/core/api/end_points.dart';
import 'package:food_ninja/core/helpers/cache_helper.dart';
import 'package:food_ninja/model/get_user_data_model.dart';
import 'package:food_ninja/model/login_model.dart';
import 'package:image_picker/image_picker.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());

  final ApiConsumer api;

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
  GetUserDataModel? userData;

  Future signUp() async {
    if (signUpAnamwp.text.isEmpty ||
        signUpEmail.text.isEmpty ||
        signUpPassword.text.isEmpty) {
      emit(SignUpFailure(message: 'Please Fill in the required Fields'));
      return;
    }
    try {
      emit(SignUpLoading());
      await api.post(EndPoints.signUP, data: {
        ApiKey.name: signUpAnamwp.text.replaceAll(' ', ''),
        ApiKey.email: signUpEmail.text.replaceAll(' ', ''),
        ApiKey.password: signUpPassword.text.replaceAll(' ', ''),
        ApiKey.avatar: "https://picsum.photos/800",
      });
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure(message: e.toString()));
    }
  }

  Future<void> login() async {
    emit(LoginLoading());
    try {
      final loginResponse = await api.post(EndPoints.signIn, data: {
        ApiKey.email: signInEmail.text,
        ApiKey.password: signInPassword.text
      });
      final user = LoginModel.fromJson(loginResponse);
      CacheHelper().saveData(key: ApiKey.accessToken, value: user.accessToken);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }

  void getUserData() async {
    emit(LoginLoading());
    try {
      final response = await api.get(
        EndPoints.getUser,
      );
      userData = GetUserDataModel.fromJson(response);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }

  void updateUserInfo(String updateType, String update) async {
    emit(UpdateInfoLoading());
    try {
      await api.put(
        EndPoints.updateProfile,
        data: {updateType: update},
      );
      emit(UpdateInfoSuccess());
    } catch (e) {
      emit(UpdateInfoFailed(message: e.toString()));
    }
  }

  void keepMeSignedPressed() {
    keepMeSigned = !keepMeSigned;
    emit(IconButtonPressed());
  }

  void emailSpecialPricingPressed() {
    emailSpecialPricing = !emailSpecialPricing;
    emit(IconButtonPressed());
  }

  void clearFields() {
    signUpPassword.clear();
    signUpEmail.clear();
    signUpAnamwp.clear();
    signInEmail.clear();
    signInPassword.clear();
  }

  Future pickImageFromGallery() async {
    profileImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(ChangeProfileImage());
  }

  Future pickImageFromCamera() async {
    profileImage = await ImagePicker().pickImage(source: ImageSource.camera);
    emit(ChangeProfileImage());
  }

  void cancelImage() {
    profileImage = null;
    emit(ChangeProfileImage());
  }
}
