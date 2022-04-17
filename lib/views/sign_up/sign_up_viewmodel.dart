import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/models/sign_up/sign_up_request_model.dart';
import 'package:wallet/models/sign_up/sign_up_response_model.dart';
import 'package:wallet/services/auth_service.dart';
import 'package:wallet/services/exception_handler.dart';
import 'package:wallet/utils/validator.dart';
import 'package:wallet/views/widgets/snackbar_manager.dart';

class SignUpViewModel extends GetxController {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  RxnString fullnameError = RxnString();
  RxnString passwordError = RxnString();
  RxnString confirmPasswordError = RxnString();
  RxnString emailError = RxnString();

  // RxBool isButtonEnabled = RxBool(false);
  RxBool notificationsSettings = RxBool(true);
  RxBool isLoading = RxBool(false);
  RxBool isConfirmPasswordObscure = RxBool(true);
  RxBool isPasswordObscure = RxBool(true);
  RxBool termsAndConditionsAccepted = RxBool(false);
  RxBool isLocationLoading = RxBool(false);

  String _html = '';

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> continuePressed() async {
    String fullname = fullnameController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    String emailAddress = emailController.text;

    emailError.value = Validator.validateEmail(emailAddress);
    fullnameError.value = Validator.validateFullname(fullname);
    List<String?> passwordsError =
        Validator.validatePasswords(password, confirmPassword);
    passwordError.value = passwordsError.first;
    confirmPasswordError.value = passwordsError.last;

    if (fullnameError.value == null &&
        passwordError.value == null &&
        emailError.value == null &&
        confirmPasswordError.value == null) {
      isLoading.value = true;
      bool isRegistered = await registerAppUser(SignUpRequestModel(
          email: emailAddress,
          password: password,
          confirmPassword: confirmPassword,
          name: fullname));
      if (isRegistered) {
        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    }
  }

  Future<bool> registerAppUser(SignUpRequestModel request) async {
    try {
      SignUpReponseModel response =
          await AuthService().registerAppUser(request);
      if (response.status != null && response.status!) {
        SnackbarManager().showSuccessSnackbar(response.message!);
        return response.status!;
      } else if (response.alreadyExists!) {
        SnackbarManager().showAlertSnackbar(
          response.message!,
        );
        return !response.alreadyExists!;
      }
      return false;
    } on DioError catch (e) {
      ExceptionHandler().handle(e);
      return false;
    }
  }
}
