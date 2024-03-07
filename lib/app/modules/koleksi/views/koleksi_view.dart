import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/koleksi_controller.dart';

class KoleksiView extends GetView<KoleksiController> {
  const KoleksiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Koleksi')),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Material(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 55,
                    child: FractionallySizedBox(
                      widthFactor: 0.6,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: Theme.of(context).colorScheme.copyWith(
                            surfaceVariant: Colors.transparent,
                          ),
                        ),
                        child: TabBar(
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                            physics: const ClampingScrollPhysics(),
                            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                            unselectedLabelColor: Theme.of(context).primaryColor,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Theme.of(context).primaryColorLight),
                            tabs: [
                              Tab(
                                child: Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          color:
                                          Theme.of(context).primaryColorLight)),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text("Koleksi")),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          color:
                                          Theme.of(context).primaryColorLight)),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text("Peminjaman")),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(
                      child: Text("Koleksi"),
                    ),
                    Center(
                      child: Text("Peminjaman"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

