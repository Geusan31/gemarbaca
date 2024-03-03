import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/model/response_genre.dart';
import 'package:gemarbaca/app/modules/buku/controllers/buku_controller.dart';
import 'package:gemarbaca/app/widget/detail/detail_kategori_genre_widget.dart';
import 'package:get/get.dart';

class NestedTabBar extends StatelessWidget {
  final List<String> tabs;
  final List<List<Map<String, dynamic>>> bukuLists;

  NestedTabBar({required this.tabs, required this.bukuLists});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabs: tabs.map((String tab) => Tab(text: tab)).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: bukuLists.map((List<Map<String, dynamic>> bukuList) {
                return BukuGridView(bukuList: bukuList);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
