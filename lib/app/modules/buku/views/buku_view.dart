import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gemarbaca/app/widget/base64/base64_widget.dart';
import 'package:gemarbaca/app/widget/circletabindicator/cirlce_tab_indicator.dart';

import 'package:get/get.dart';

import '../controllers/buku_controller.dart';

class BukuView extends GetView<BukuController> {
  const BukuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("Panjang data category: ${controller.dataKategoriList.length}");
    log("Panjang data genre: ${controller.dataGenreList.length}");
    Future.delayed(const Duration(seconds: 5));
    log("Category Book: ${controller.categoryBookControllers?.length}");
    log("Genre Book: ${controller.genreBookControllers?.length}");

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          titleSpacing: 0,
          title: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        surfaceVariant: Colors.transparent,
                      ),
                ),
                child: TabBar(
                  controller: controller.tabController,
                  labelStyle: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColor),
                  indicator: CircleTabIndicator(
                      color: Theme.of(context).primaryColor, radius: 4),
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.grey,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  tabs: controller.appBarTitles
                      .map((e) => Tab(
                            text: e,
                          ))
                      .toList(),
                  onTap: (int a) {
                    log('Index $a');
                  },
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: [
            // Kategori Tab
            if (controller.dataKategoriList.isNotEmpty)
              ListView.builder(
                  itemCount: controller.dataKategoriList.length,
                  itemBuilder: (BuildContext context, index) {
                    log("Index Atas: $index");
                    return Column(
                      children: [
                        Obx(() {
                          return Container(
                            padding: EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              children: [
                                TabBar(
                                  controller: controller.categoryTabController!,
                                  onTap: (int a) {
                                    log('Kategori Index $a');
                                  },
                                  tabs: controller.dataKategoriList
                                      .map((kategori) =>
                                      Tab(text: kategori.namaKategori))
                                      .toList(),
                                ),
                                controller.categoryBookControllers!.isEmpty
                                    ? const Text("KOCAKKKKKK")
                                    : Expanded(
                                  child: TabBarView(
                                      controller: controller
                                          .categoryBookControllers![index],
                                      children: controller.dataKategoriList
                                          .map((kategori) {
                                        return GridView.builder(
                                          gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 200,
                                              childAspectRatio: 1,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20),
                                          itemCount:
                                          kategori.buku?.length ?? 0,
                                          itemBuilder:
                                              (context, bukuIndex) {
                                            log("Buku Index: $bukuIndex");
                                            log("Index: $index");
                                            log("${controller.dataKategoriList[index].buku?[bukuIndex].buku?.judul}");
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  right: 15),
                                              padding:
                                              const EdgeInsets.all(7),
                                              decoration:
                                              const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius
                                                          .circular(
                                                          10))),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: 100,
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        const BorderRadius
                                                            .all(Radius
                                                            .circular(
                                                            8)),
                                                        image:
                                                        DecorationImage(
                                                          image: (controller.dataKategoriList[index].buku?[bukuIndex].buku?.cover != null &&
                                                              controller.dataKategoriList[index].buku?[bukuIndex].buku?.cover!.isNotEmpty)
                                                              ? base64Widget(controller.dataKategoriList[1].buku?[bukuIndex].buku?.cover ?? "")
                                                              : const AssetImage("assets/img/default/default_image.png"),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                    controller.dataKategoriList[index].buku?[bukuIndex].buku?.judul ?? "",
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      }).toList()),
                                ),
                              ],
                            ),
                          );
                        })
                      ],
                    );
                  }),
            // Genre Tab
            if (controller.dataGenreList.isNotEmpty)
              ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              TabBar(
                                controller: controller.genreTabController!,
                                onTap: (int a) {
                                  log('Genre Index $a');
                                },
                                tabs: controller.dataGenreList
                                    .map((genre) => Tab(text: genre.nama))
                                    .toList(),
                              ),
                              controller.genreBookControllers!.isEmpty
                                  ? Text("KOCAKKKKKK")
                                  : Expanded(
                                      child: TabBarView(
                                          controller: controller
                                              .genreBookControllers![index],
                                          children: controller.dataGenreList
                                              .map((genre) {
                                            return GridView.builder(
                                              gridDelegate:
                                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                                      maxCrossAxisExtent: 200,
                                                      childAspectRatio: 1,
                                                      crossAxisSpacing: 20,
                                                      mainAxisSpacing: 20),
                                              itemCount:
                                                  genre.buku?.length ?? 0,
                                              itemBuilder:
                                                  (context, bukuIndex) {
                                                return Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 15),
                                                  padding:
                                                      const EdgeInsets.all(7),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8)),
                                                            image:
                                                                DecorationImage(
                                                              image: (controller
                                                                              .dataGenreList[
                                                                                  index]
                                                                              .buku?[
                                                                                  0]
                                                                              .buku
                                                                              ?.cover !=
                                                                          null &&
                                                                      controller
                                                                          .dataGenreList[
                                                                              index]
                                                                          .buku?[
                                                                              0]
                                                                          .buku
                                                                          ?.cover!
                                                                          .isNotEmpty)
                                                                  ? base64Widget(controller
                                                                          .dataGenreList[
                                                                              index]
                                                                          .buku?[
                                                                              0]
                                                                          .buku
                                                                          ?.cover ??
                                                                      "")
                                                                  : const AssetImage(
                                                                      "assets/img/default/default_image.png"),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 7,
                                                      ),
                                                      Text(
                                                        controller
                                                                .dataGenreList[
                                                                    index]
                                                                .buku?[0]
                                                                .buku
                                                                ?.judul ??
                                                            "",
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          }).toList()),
                                    ),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
          ],
        ),
      );
    });
  }
}
