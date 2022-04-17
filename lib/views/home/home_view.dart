import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/views/home/deposite/deposit_view.dart';
import 'package:wallet/views/home/history/history_view.dart';
import 'package:wallet/views/home/home_viewmodel.dart';
import 'package:wallet/views/home/products/products_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeViewModel>(
        init: Get.put(HomeViewModel()),
        builder: (m) {
          return WillPopScope(
              onWillPop: () async {
                m.handleBack();
                return Future.value(false);
              },
              child: Scaffold(
                  bottomNavigationBar: BottomNavigationBar(
                      currentIndex: m.currentIndex.value,
                      onTap: (val) {
                        m.onBottomNavBarTap(val);
                      },
                      showUnselectedLabels: true,
                      backgroundColor: Colors.blue,
                      unselectedIconTheme:
                          const IconThemeData(color: Colors.white),
                      unselectedItemColor: Colors.white,
                      selectedItemColor: Colors.white,
                      selectedLabelStyle:
                          const TextStyle(fontWeight: FontWeight.bold),
                      items: [
                        BottomNavigationBarItem(
                            backgroundColor: Colors.orange,
                            icon: const Icon(Icons.home),
                            label: 'Home'.tr),
                        BottomNavigationBarItem(
                          backgroundColor: Colors.orange,
                          icon: const Icon(Icons.sell),
                          label: 'Purchase'.tr,
                        ),
                        BottomNavigationBarItem(
                          backgroundColor: Colors.orange,
                          icon: m.image.value != null
                              ? CircleAvatar(
                                  radius: 12, backgroundImage: m.image.value)
                              : const Icon(Icons.history),
                          label: 'History'.tr,
                        ),
                      ]),
                  body: m.currentIndex.value == 0
                      ? const DepositView()
                      : m.currentIndex.value == 1
                          ? const ProductView()
                          : m.currentIndex.value == 2
                              ? const HistoryView()
                              : Container()));
        });
  }
}
