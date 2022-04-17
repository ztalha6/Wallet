import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/models/sign_in/sign_in_request_model.dart';
import 'package:wallet/models/sign_in/sign_in_rresponse_model.dart';
import 'package:wallet/repo/user_repo.dart';
import 'package:wallet/services/auth_service.dart';
import 'package:wallet/services/exception_handler.dart';
import 'package:wallet/services/http/dio_interceptor.dart';
import 'package:wallet/utils/validator.dart';
import 'package:wallet/views/home/home_view.dart';
import 'package:wallet/views/widgets/snackbar_manager.dart';

class SignInViewModel extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool passwordVisibility = false.obs;
  RxBool isLoading = false.obs;

  RxnString emailError = RxnString();

  RxnString passwordError = RxnString();

  void goToSignUpView() {
    // Get.to(() => const SignUpView());
  }

  Future<void> loginPressed() async {
    String email = emailController.text;
    String password = passwordController.text;

    emailError.value = Validator.validateEmail(email);
    passwordError.value = Validator.validatePassword(password);

    if (emailError.value == null && passwordError.value == null) {
      isLoading.value = true;
      SignInResponseModel response = await loginAppUser(
          SignInRequestModel(email: email, password: password));
      if (response.success!) {
        await UserRepo().saveUserId(response.userID!);
        SnackbarManager().showSuccessSnackbar('Login successfull');
        isLoading.value = false;
        Get.to(() => const HomeView());
      } else {
        isLoading.value = false;
      }
    }
  }

  Future<SignInResponseModel> loginAppUser(SignInRequestModel request) async {
    try {
      SignInResponseModel response = await AuthService().loginAppUser(request);
      if (!response.success!) {
        SnackbarManager().showAlertSnackbar(
          'invalid_creds'.tr,
        );
      }
      return response;
    } on DioError catch (e) {
      ExceptionHandler().handle(e);
      return SignInResponseModel(success: false);
    }
  }

  // Future<bool> checkNotificationModuleWise() async {
  //   try {
  //     CheckNotificationModuleWiseResponse response = await NotificationService()
  //         .checkNotificationModuleWise(ModuleID.signIn);
  //     return response.isNotificationEnabled!;
  //   } catch (e) {
  //     ExceptionHandler().handle(e);
  //     return false;
  //   }
  // }

  // Future<bool> sendNotification(SendNotificationRequest request) async {
  //   try {
  //     SendNotificationResponse response =
  //         await NotificationService().sendNotification(request);
  //     return response.isEmailNotificationSent! ||
  //         response.isSMSNotificationSent!;
  //   } catch (e) {
  //     ExceptionHandler().handle(e);
  //     return false;
  //   }
  // }
}
