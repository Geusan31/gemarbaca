import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/koleksi_controller.dart';

class KoleksiView extends GetView<KoleksiController> {
  const KoleksiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koleksi'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: TabBar(
              controller: controller.tabController,
              tabs: const [Tab(text: 'Koleksi'), Tab(text: 'Peminjaman')],
            ),
          ),
        ),
      ),
      body: TabBarView(
      controller: controller.tabController,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.red,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
