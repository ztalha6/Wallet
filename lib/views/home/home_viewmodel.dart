import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  RxInt currentIndex = 0.obs;
  Rxn<MemoryImage> image = Rxn<MemoryImage>();

  void onBottomNavBarTap(int index) {
    currentIndex.value = index;
  }

  void handleBack() {
    currentIndex.value = 0;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    // await handleGetAppUser();
  }

  // Future<void> handleGetAppUser() async {
  //   // GetAppUserResponse appUser = await getAppUser(await UserRepo().getUserId());
  //   // if (appUser.id != 0) {
  //   //   _processData(appUser);
  //   // }
  // }

  // void _processData(GetAppUserResponse appUser) {
  //   image.value = appUser.profileImage != null
  //       ? ImageUtil.imageFromBase64String(appUser.profileImage!)
  //       : null;
  // }

  // Future<GetAppUserResponse> getAppUser(int userKescId) async {
  //   try {
  //     GetAppUserResponse response =
  //         await ProfileService().getAppUser(userKescId);
  //     return response;
  //   } catch (e) {
  //     ExceptionHandler().handle(e);
  //     return GetAppUserResponse(id: 0);
  //   }
  // }
}
