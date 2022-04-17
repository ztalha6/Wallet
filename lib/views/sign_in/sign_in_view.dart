import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallet/views/sign_in/sign_in_viewmodel.dart';
import 'package:wallet/views/sign_up/sign_up_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignInViewModel());
    return GetX<SignInViewModel>(builder: (m) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text('Sign In')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Welcome to '.tr,
                      style: Theme.of(context).textTheme.headline5!),
                  TextSpan(
                      text: 'Wallets'.tr,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor)),
                ]),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: m.emailController,
                      decoration: InputDecoration(
                        errorText: m.emailError.value,
                        hintText: 'email'.tr,
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    keyboardType: TextInputType.visiblePassword,
                    controller: m.passwordController,
                    obscureText: !m.passwordVisibility.value,
                    decoration: InputDecoration(
                        errorText: m.passwordError.value,
                        hintText: 'password'.tr,
                        suffixIcon: GestureDetector(
                          child: !m.passwordVisibility.value
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onTap: () {
                            //flip visibility icon
                            m.passwordVisibility(!m.passwordVisibility.value);
                          },
                        )),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     TextButton(
                  //       onPressed: () {
                  //         //go to forgot password screen
                  //         // Get.to(() => const ForgotPasswordView());
                  //       },
                  //       child: Text('forgot password?'.tr),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 16,
                  ),
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
                                    'login'.tr,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                            onPressed: m.isLoading.value
                                ? () {}
                                : () {
                                    m.loginPressed();
                                  }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont have an account?'.tr),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const SignUpView());
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
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
