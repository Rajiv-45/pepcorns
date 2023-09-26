import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pepcorns/coin_controllers.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final CoinController controller = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // print(w);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout))
        ],
        title: Text("Crypto Tracker"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 115, 227, 173),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: w * 0.04, top: 0.04),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.amber,
                margin: EdgeInsets.only(left: w * 0.04, top: w * 0.05),
                child: Text(
                  "Crypto Market",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Obx(
                () => controller.isloading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 50,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: w * 0.07),
                            child: Container(
                              width: w,
                              height: 60,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        // color: Colors.black,
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            //color: Colors.yellow[700],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.white,
                                                offset: Offset(4, 4),
                                                blurRadius: 5,
                                              ),
                                            ]),
                                        child: Padding(
                                          padding: EdgeInsets.all(6),
                                          child: Image.network(
                                              controller.coinList[index].image),
                                        ),
                                      ),
                                      SizedBox(
                                        width: w * 0.04,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(w * 0.02),
                                        child: Column(
                                          children: [
                                            Text(
                                              controller.coinList[index].name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "${controller.coinList[index].priceChangePercentage24H}%",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.black45),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: w * 0.04, top: w * 0.02),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "\$${controller.coinList[index].currentPrice}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          controller.coinList[index].symbol,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.black45),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
