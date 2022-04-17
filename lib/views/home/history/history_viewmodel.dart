import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wallet/models/history/history_response_model.dart';
import 'package:wallet/repo/user_repo.dart';
import 'package:wallet/services/auth_service.dart';
import 'package:wallet/services/exception_handler.dart';

class HistoryViewModel extends GetxController {
  List<Result> allHistoryList = [];
  RxBool isLoading = false.obs;
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    await getWalletHistory();
  }

  Future<void> getWalletHistory() async {
    isLoading.value = true;
    allHistoryList = await gethistoryList();
    isLoading.value = false;
  }

  Future<List<Result>> gethistoryList() async {
    try {
      HistoryResponseModel response = await AuthService()
          .getUserWalletHistory(await UserRepo().getUserId());
      return response.result!;
    } on DioError catch (e) {
      ExceptionHandler().handle(e);
      return [];
    }
  }
}
