import 'package:dio/dio.dart';
import 'package:wallet/views/widgets/snackbar_manager.dart';

import 'http/dio_interceptor.dart';

class ExceptionHandler {
  void handle(DioError e) {
    if (e.error != null) {
      SnackbarManager().showAlertSnackbar(e.response!.data['message']);
    } else if (e is BadRequestException ||
        e is UnauthorizedException ||
        e is InternalServerErrorException ||
        e is NoInternetConnectionException ||
        e is DeadlineExceededException) {
      SnackbarManager().showAlertSnackbar(e.toString());
    }
  }
}
