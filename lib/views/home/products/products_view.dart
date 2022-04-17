import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:wallet/views/home/products/product_viewmodel.dart';
import 'package:wallet/views/sign_in/sign_in_view.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductViewModel());
    return GetX<ProductViewModel>(builder: (m) {
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
            // physics: BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
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
                                text: 'Our ',
                                style: Theme.of(context).textTheme.headline5!),
                            TextSpan(
                                text: 'Products',
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
                          child:
                              // GridView.builder(
                              //     physics: NeverScrollableScrollPhysics(),
                              //     shrinkWrap: true,
                              //     gridDelegate:
                              //         const SliverGridDelegateWithMaxCrossAxisExtent(
                              //             maxCrossAxisExtent: 200,
                              //             childAspectRatio: 3 / 2,
                              //             crossAxisSpacing: 20,
                              //             mainAxisSpacing: 20),
                              //     itemCount: m.allProductsList.length,
                              //     itemBuilder: (BuildContext ctx, index) {
                              //       return Card(
                              //         child: Column(
                              //           children: [
                              //             SizedBox(
                              //               height: 100,
                              //               child: Image.network(
                              //                 m.allProductsList[index].image!,
                              //               ),
                              //             ),
                              //             Text(m.allProductsList[index].brand!),
                              //           ],
                              //         ),
                              //         // decoration: BoxDecoration(
                              //         //     color: Colors.amber,
                              //         //     borderRadius: BorderRadius.circular(15)),
                              //       );
                              //     }),
                              GridView.count(
                            childAspectRatio: 0.65,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            children: List.generate(m.allProductsList.length,
                                (index) {
                              return Card(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      child: Image.network(
                                        m.allProductsList[index].image!,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            m.allProductsList[index].brand!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            m.allProductsList[index]
                                                .description!,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Price: ',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                m.allProductsList[index].price!
                                                        .toString() +
                                                    ' PKR',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    CupertinoButton(
                                        pressedOpacity: 0.7,
                                        color: Colors.blue,
                                        child: m.isLoading.value
                                            ? const SizedBox(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              )
                                            : Text(
                                                'Buy',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                        onPressed: m.isLoading.value
                                            ? () {}
                                            : () {
                                                // m.loginPressed();
                                              })
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
