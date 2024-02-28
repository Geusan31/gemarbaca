import 'package:flutter/material.dart';
import 'package:gemarbaca/app/widget/nestedtabbar/nested_tab_bar_widget.dart';
import 'package:gemarbaca/app/widget/circletabindicator/cirlce_tab_indicator.dart';

import 'package:get/get.dart';

import '../controllers/buku_controller.dart';

class BukuView extends GetView<BukuController> {
  const BukuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 0,
        title: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                  surfaceVariant: Colors.transparent
                )
              ),
              child: TabBar(
                controller: controller.tabController,
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor
                ),
                indicator: CircleTabIndicator(color: Theme.of(context).primaryColor, radius: 4  ),
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.grey,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                tabs: const [
                  Tab(text: 'Kategori'),
                  Tab(text: 'Genre'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          NestedTabBar(tabs: ['Novel', 'Komik', 'Manga', "asdsa", "asdasd", "asdsad", "asdas", "adsadas"]),
          NestedTabBar(tabs: ['Fantasy', 'Action', 'Comedy']),
        ],
      ),
    );
  }
}