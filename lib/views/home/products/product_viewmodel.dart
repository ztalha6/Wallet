import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wallet/models/product/product_response_model.dart';
import 'package:wallet/services/auth_service.dart';
import 'package:wallet/services/exception_handler.dart';

class ProductViewModel extends GetxController {
  List<Products> allProductsList = [];
  RxBool isLoading = false.obs;
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    isLoading.value = true;
    allProductsList = await getProductList();
    isLoading.value = false;
  }

  Future<List<Products>> getProductList() async {
    try {
      ProductReponseModel response = await AuthService().getProducts();
      return response.products!;
    } on DioError catch (e) {
      ExceptionHandler().handle(e);
      return [];
    }
  }
}
