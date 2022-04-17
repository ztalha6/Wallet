import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:wallet/views/home/deposite/deposit_viewmodel.dart';
import 'package:wallet/views/sign_in/sign_in_view.dart';

class DepositView extends StatelessWidget {
  const DepositView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DepositViewModel());
    return GetX<DepositViewModel>(builder: (m) {
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
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Deposit to ',
                      style: Theme.of(context).textTheme.headline5!),
                  TextSpan(
                      text: 'Wallets',
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
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('PKR ',
                            style: Theme.of(context).textTheme.headline5!),
                      ),
                      Expanded(
                        flex: 8,
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: m.amountController,
                            decoration: InputDecoration(
                              errorText: m.amountError.value,
                              hintText: 'amount',
                            )),
                      ),
                    ],
                  ),
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
                                    'Deposit',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                            onPressed: m.isLoading.value
                                ? () {}
                                : () {
                                    m.depositBalance();
                                  }),
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
