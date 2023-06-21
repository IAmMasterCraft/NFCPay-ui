// ignore_for_file: unused_import

import 'package:get/get.dart';
import '../binding/splash_binding.dart';
import '../views/auth/signin/otp_verification_signin.dart';
import '../views/auth/signin/reset_password_screen.dart';
import '../views/auth/signin/sign_in_screen.dart';
import '../views/auth/signup/otp_verification_signup.dart';
import '../views/auth/signup/sign_up_screen.dart';
import '../views/btm/btm_nav_screen.dart';
import '../views/btm/notification_screen.dart';
import '../views/connect_card/add_new_card_screen.dart';
import '../views/connect_card/connect_card_form_screen.dart';
import '../views/connect_card/connect_card_screen.dart';
import '../views/connect_card/update_card_screen.dart';
import '../views/drawer_screens/change_password_screen.dart';
import '../views/drawer_screens/history_screen.dart';
import '../views/drawer_screens/update_profile_screen.dart';
import '../views/onboard/onboard_screen.dart';
import '../views/payment/payment_confirmation_screen.dart';
import '../views/payment/payment_screen.dart';
import '../views/payment/payment_select_card.dart';
import '../views/splash_screen/splash_screen.dart';
import 'routes.dart';

class Pages {
  static var list = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onboardScreen,
      page: () => OnboardScreen(),
      
    ),
    GetPage(
      name: Routes.signInScreen,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: Routes.otpSignInScreen,
      page: () => OTPSignInScreen(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => ResetPasswordScreen(),
    ),

    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      
    ),
    GetPage(
      name: Routes.otpSignUpScreen,
      page: () => OTPSignUpScreen(),

    ),

    GetPage(
      name: Routes.connectCardScreen,
      page: () => ConnectCardScreen(),
  
    ),
    GetPage(
      name: Routes.connectCardFormScreen,
      page: () => ConnectCardFormScreen(),
      
    ),

    GetPage(
      name: Routes.btmNavScreen,
      page: () => BTMNavScreen(),

    ),

    GetPage(
      name: Routes.historyScreen,
      page: () => const HistoryScreen(),
    
    ),
    GetPage(
      name: Routes.notificationScreen,
      page: () => const NotificationScreen(),
     
    ),
    GetPage(
      name: Routes.updateProfileScreen,
      page: () => UpdateProfileScreen(),

    ),



    GetPage(
      name: Routes.updateCardScreen,
      page: () => UpdateCardScreen(),
    ),
    GetPage(
      name: Routes.addNewCardScreen,
      page: () => AddNewCardScreen(),
    ),

    GetPage(
      name: Routes.paymentSelectCardScreen,
      page: () => const PaymentSelectCardScreen(),
    
    ),
    GetPage(
      name: Routes.paymentScreen,
      page: () => const PaymentScreen(),
    ),
    GetPage(
      name: Routes.paymentConfirmationScreen,
      page: () => const PaymentConfirmationScreen(),

    ),
     GetPage(
      name: Routes.changePasswordScreen,
      page: () =>  ChangePasswordScreen(),
      
    ),
  ];
}
