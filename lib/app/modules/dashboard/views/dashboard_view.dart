import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/dashboard_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 15),
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://i.pinimg.com/736x/07/33/ba/0733ba760b29378474dea0fdbcb97107.jpg"))),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FutureBuilder<String>(
                                  future: controller.nameView(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<String> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(
                                          width: 200,
                                          height: 20,
                                          color: Colors.grey,
                                        ),
                                      );
                                    } else {
                                      if (snapshot.hasError) {
                                        return Text("Error: ${snapshot.error}");
                                      } else {
                                        return Text(snapshot.data!,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold));
                                      }
                                    }
                                  }),
                              Text(controller.welcome(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.toNamed(Routes.SEARCH);
                            },
                            icon: const Icon(
                              CupertinoIcons.search,
                              size: 25,
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white60))),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.bell,
                              size: 25,
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white60))),
                      ],
                    )
                  ],
                ),
              ),
            ]))));
  }
}
