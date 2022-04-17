import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallet/views/sign_up/sign_up_viewmodel.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpViewModel());
    return GetX<SignUpViewModel>(builder: (m) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(CupertinoIcons.arrow_left),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                'Create account'.tr,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Set your email and pass'.tr,
              ),
              const SizedBox(height: 16),
              TextFormField(
                onFieldSubmitted: (val) async {},
                onChanged: (val) async {},
                keyboardType: TextInputType.emailAddress,
                controller: m.emailController,
                decoration: InputDecoration(
                    labelText: 'email'.tr, errorText: m.emailError.value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                onFieldSubmitted: (val) async {},
                onChanged: (val) async {},
                keyboardType: TextInputType.text,
                controller: m.fullnameController,
                decoration: InputDecoration(
                    labelText: 'full name'.tr,
                    errorText: m.fullnameError.value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                keyboardType: TextInputType.visiblePassword,
                controller: m.passwordController,
                obscureText: m.isPasswordObscure.value,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      child: !m.isPasswordObscure.value
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onTap: () {
                        //flip visibility icon
                        m.isPasswordObscure.value = !m.isPasswordObscure.value;
                      },
                    ),
                    labelText: 'password'.tr,
                    errorText: m.passwordError.value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                keyboardType: TextInputType.visiblePassword,
                controller: m.confirmPasswordController,
                obscureText: m.isConfirmPasswordObscure.value,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      child: !m.isConfirmPasswordObscure.value
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onTap: () {
                        //flip visibility icon
                        m.isConfirmPasswordObscure.value =
                            !m.isConfirmPasswordObscure.value;
                      },
                    ),
                    labelText: 'confirm password'.tr,
                    errorText: m.confirmPasswordError.value),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                        pressedOpacity: 0.7,
                        color: Colors.blue,
                        child: m.isLoading.value
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                'Sign Up'.tr,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                        onPressed: m.isLoading.value
                            ? () {}
                            : () {
                                m.continuePressed();
                              }),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'.tr),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Sign In'.tr,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
