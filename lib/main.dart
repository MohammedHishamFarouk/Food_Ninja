import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/style/theme_manager.dart';
import 'package:food_ninja/modelView/chatCubit/chat_cubit.dart';
import 'package:food_ninja/modelView/orderCubit/order_cubit.dart';
import 'package:food_ninja/modelView/productsCubit/products_cubit.dart';
import 'package:food_ninja/modelView/resetPassCubit/reset_pass_cubit.dart';
import 'package:food_ninja/modelView/searchCubit/search_cubit.dart';
import 'package:food_ninja/modelView/userCubit/user_cubit.dart';
import 'package:food_ninja/view/screens/auth/fill_bio_screen.dart';
import 'package:food_ninja/view/screens/auth/loginScreen/login_screen.dart';
import 'package:food_ninja/view/screens/auth/payment_method.dart';
import 'package:food_ninja/view/screens/auth/set_location_screen.dart';
import 'package:food_ninja/view/screens/auth/setup_done_screen.dart';
import 'package:food_ninja/view/screens/auth/signupScreen/signup_screen.dart';
import 'package:food_ninja/view/screens/auth/upload_photo_screen.dart';
import 'package:food_ninja/view/screens/homePageSections/home_screen.dart';
import 'package:food_ninja/view/screens/navigation_bar_screen.dart';
import 'package:food_ninja/view/screens/notification/notification_screen.dart';
import 'package:food_ninja/view/screens/onboarding/onboarding_screen1.dart';
import 'package:food_ninja/view/screens/onboarding/onboarding_screen2.dart';
import 'package:food_ninja/view/screens/orderSteps/cart_screen.dart';
import 'package:food_ninja/view/screens/orderSteps/confirm_order_screen.dart';
import 'package:food_ninja/view/screens/orderSteps/payment_screen.dart';
import 'package:food_ninja/view/screens/orderSteps/shipping_screen.dart';
import 'package:food_ninja/view/screens/password_reset/change_pass_screen.dart';
import 'package:food_ninja/view/screens/password_reset/forgotPasswordScreen/forgot_password_screen.dart';
import 'package:food_ninja/view/screens/password_reset/reset_success_screen.dart';
import 'package:food_ninja/view/screens/password_reset/verifyCodeScreen/verify_code_screen.dart';
import 'package:food_ninja/view/screens/splash_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => ProductsCubit(Dio())..getItemsList()),
        BlocProvider(create: (context) => ResetPassCubit()),
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => OrderCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.getDarkTheme,
      initialRoute: 'navigationBarScreen',
      routes: {
        'start': (context) => const SplashScreen(),
        'onboarding1': (context) => const OnBoardingScreen1(),
        'onboarding2': (context) => const OnBoardingScreen2(),
        'login': (context) => const LoginScreen(),
        'forgotPassword': (context) => const ForgotPasswordScreen(),
        'VerifyCode': (context) => const VerifyCodeScreen(),
        'changePass': (context) => const ChangePassScreen(),
        'resetSuccessful': (context) => const ResetSuccessScreen(),
        'signUp': (context) => const SignupScreen(),
        'fillBio': (context) => const FillBioScreen(),
        'paymentMethod': (context) => const PaymentMethod(),
        'uploadPhoto': (context) => const UploadPhotoScreen(),
        'setLocation': (context) => const SetLocationScreen(),
        'setupDone': (context) => const SetupDoneScreen(),
        'navigationBarScreen': (context) => const NavigationBarScreen(),
        'home': (context) => const HomeScreen(),
        'cartScreen': (context) => const CartScreen(),
        'confirmOrderScreen': (context) => const ConfirmOrderScreen(),
        'paymentScreen': (context) => const PaymentScreen(),
        'shippingScreen': (context) => const ShippingScreen(),
        'notificationScreen': (context) => const NotificationScreen(),
      },
    );
  }
}
