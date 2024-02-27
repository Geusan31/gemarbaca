import 'package:flutter/material.dart';
import 'package:gemarbaca/app/modules/buku/controllers/buku_controller.dart';
import 'package:gemarbaca/app/widget/detail/detail_kategori_genre_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NestedTabBar extends StatelessWidget {
  final List<String> tabs;

  NestedTabBar({required this.tabs});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabController(length: tabs.length, vsync: Get.find<BukuController>()), tag: tabs.join());

    return Column(
      children: [
        TabBar(
          tabAlignment: TabAlignment.center ,
          isScrollable: true,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          controller: controller,
          tabs: tabs.map((tab) => Tab(text: tab)).toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: tabs.map((tab) => BukuGridView(title: tab)).toList(),
          ),
        ),
      ],
    );
  }
}