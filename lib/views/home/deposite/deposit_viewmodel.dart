import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wallet/models/deposit/deposit_request_model.dart';
import 'package:wallet/models/deposit/deposit_response_model.dart';
import 'package:wallet/models/sign_in/sign_in_request_model.dart';
import 'package:wallet/repo/user_repo.dart';
import 'package:wallet/services/auth_service.dart';
import 'package:wallet/services/exception_handler.dart';
import 'package:wallet/views/widgets/snackbar_manager.dart';

class DepositViewModel extends GetxController {
  TextEditingController amountController = TextEditingController();
  RxnString amountError = RxnString();
  RxBool isLoading = false.obs;

  Future<void> depositBalance() async {
    try {
      isLoading.value = true;
      if (amountController.text.isNotEmpty) {
        DepositBalanceReponseModel response =
            await AuthService().depositBalance(DepositBalanceRequestModel(
          amount: int.parse(amountController.text),
          currencyId: '6238bf6cf8b52ba80db9ae22',
          userId: await UserRepo().getUserId(),
        ));
        if (!response.status!) {
          SnackbarManager().showAlertSnackbar(
            'Something went wrong',
          );
        } else if (response.status!) {
          SnackbarManager().showSuccessSnackbar('Amount deposit successfully');
        }
      } else {
        amountError.value = 'Amount cannot be empty';
      }
      isLoading.value = false;
    } on DioError catch (e) {
      ExceptionHandler().handle(e);
      isLoading.value = false;
    }
  }
}
