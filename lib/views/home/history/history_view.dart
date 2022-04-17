import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:wallet/views/home/history/history_viewmodel.dart';
import 'package:wallet/views/sign_in/sign_in_view.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HistoryViewModel());
    return GetX<HistoryViewModel>(builder: (m) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue,
          centerTitle: false,
          title: Text(
            'Wallet',
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout_rounded),
              onPressed: () {
                Get.offAll(() => const SignInView());
              },
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.account_balance_wallet_rounded,
              size: 40,
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () => m.onInit(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'History of ',
                              style: Theme.of(context).textTheme.headline5!),
                          TextSpan(
                              text: 'Wallet',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor)),
                        ]),
                      ),
                    ],
                  ),
                )),
                m.isLoading.value
                    ? CircularProgressIndicator(
                        color: Colors.blue,
                      )
                    : SizedBox(
                        // height: 550,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: m.allHistoryList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                  leading: Text(
                                    '${index + 1}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Text(
                                    '',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 15),
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          m.allHistoryList[index].description!),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Visibility(
                                            visible: m.allHistoryList[index]
                                                    .credit !=
                                                null,
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Credit: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(m.allHistoryList[index]
                                                    .credit
                                                    .toString()),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                            visible:
                                                m.allHistoryList[index].debit !=
                                                    null,
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Debit: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(m
                                                    .allHistoryList[index].debit
                                                    .toString()),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ));
                            }),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
