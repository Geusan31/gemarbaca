import 'package:flutter/material.dart';
import 'package:gemarbaca/app/modules/buku/controllers/buku_controller.dart';
import 'package:gemarbaca/app/widget/detail/detail_kategori_genre_widget.dart';
import 'package:get/get.dart';

class NestedTabBar extends StatelessWidget {
  final List<String> tabs;

  NestedTabBar({required this.tabs});

  @override
  Widget build(BuildContext context) {
    final bukuController = Get.find<BukuController>();
    final controller = TabController(length: tabs.length, vsync: bukuController);

    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                  surfaceVariant: Colors.transparent
              )
          ),
          child: TabBar(
            tabAlignment: TabAlignment.center ,
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).primaryColor,
            controller: controller,
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),
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
