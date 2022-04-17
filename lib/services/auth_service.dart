import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wallet/models/deposit/deposit_request_model.dart';
import 'package:wallet/models/deposit/deposit_response_model.dart';
import 'package:wallet/models/history/history_response_model.dart';
import 'package:wallet/models/product/product_response_model.dart';
import 'package:wallet/models/sign_in/sign_in_request_model.dart';
import 'package:wallet/models/sign_in/sign_in_rresponse_model.dart';
import 'package:wallet/models/sign_up/sign_up_request_model.dart';
import 'package:wallet/models/sign_up/sign_up_response_model.dart';
import 'package:wallet/services/global/api_contants.dart';
import 'package:wallet/services/http/api.dart';

class AuthService {
  final Api _api = Api();

  Future<HistoryResponseModel> getUserWalletHistory(String userId) async {
    Response response =
        await _api.dio.post(ApiContants.history, data: {"userId": userId});
    return HistoryResponseModel.fromJson(response.data);
  }

  // Future<ValidateKESCUserResponse> validateKescUser(int userKescId) async {
  //   Response response = await _api.dio
  //       .post(ApiContants.validateKESCUser, data: {"id": userKescId});
  //   return ValidateKESCUserResponse.fromJson(response.data);
  // }

  // Future<ValidateAppUserResponse> validateAppUser(int userKescId) async {
  //   Response response = await _api.dio
  //       .post(ApiContants.validateAppUser, data: {"id": userKescId});
  //   return ValidateAppUserResponse.fromJson(response.data);
  // }

  Future<SignInResponseModel> loginAppUser(SignInRequestModel request) async {
    Response response =
        await _api.dio.post(ApiContants.loginAppUser, data: request.toJson());
    return SignInResponseModel.fromJson(response.data);
  }

  Future<DepositBalanceReponseModel> depositBalance(
      DepositBalanceRequestModel request) async {
    Response response =
        await _api.dio.post(ApiContants.deposit, data: request.toJson());
    return DepositBalanceReponseModel.fromJson(response.data);
  }

  // Future<ForgotPasswordResponse> forgotPassword(
  //     ForgotPasswordRequest request) async {
  //   Response response =
  //       await _api.dio.post(ApiContants.forgotPassword, data: request.toJson());
  //   return ForgotPasswordResponse.fromJson(response.data);
  // }

  Future<SignUpReponseModel> registerAppUser(SignUpRequestModel request) async {
    Response response = await _api.dio
        .post(ApiContants.registerAppUser, data: request.toJson());
    return SignUpReponseModel.fromJson(response.data);
  }

  Future<ProductReponseModel> getProducts() async {
    Response response = await _api.dio.get(ApiContants.products);
    return ProductReponseModel.fromJson(response.data);
  }
}
