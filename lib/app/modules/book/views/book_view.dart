import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';
import 'package:gemarbaca/app/widget/base64/base64_widget.dart';
import 'package:gemarbaca/app/widget/circletabindicator/cirlce_tab_indicator.dart';

import 'package:get/get.dart';

import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
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
                  controller: controller.appBarController,
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
        body: Obx(
          () => controller.status.value == RxStatus.loading()
              ? Center(child: CircularProgressIndicator())
              : DefaultTabController(
                  length: controller.dataGenreList.length +
                      controller.dataKategoriList.length,
                  child: Column(
                    children: [
                      TabBar(
                        controller: controller.tabController,
                        isScrollable: true,
                        tabs: controller.dataGenreList
                            .map((item) => Tab(text: item.nama))
                            .toList()
                          ..addAll(controller.dataKategoriList
                              .map((item) => Tab(text: item.namaKategori))
                              .toList()),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: controller.dataGenreList.map((genre) {
                            return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 1,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemCount: genre.buku?.length ?? 0,
                              itemBuilder: (context, bukuIndex) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  padding: const EdgeInsets.all(7),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onLongPress: () {
                                            String? bookID = genre
                                                .buku?[bukuIndex].buku?.bukuID
                                                ?.toString();
                                            if (bookID != null) {
                                              Get.toNamed(Routes.EDIT_BOOK,
                                                  parameters: {'id': bookID});
                                            }
                                          },
                                          onTap: () {
                                            String? bookID = genre
                                                .buku?[bukuIndex].buku?.bukuID
                                                ?.toString();
                                            if (bookID != null) {
                                              Get.toNamed(Routes.DETAIL_BUKU,
                                                  parameters: {'id': bookID});
                                            }
                                          },
                                          child: Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(8)),
                                              image: DecorationImage(
                                                image: (genre.buku?[bukuIndex]
                                                                .buku?.cover !=
                                                            null &&
                                                        genre
                                                            .buku?[bukuIndex]
                                                            .buku
                                                            ?.cover!
                                                            .isNotEmpty)
                                                    ? base64Widget(genre
                                                            .buku?[bukuIndex]
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
                                      ),
                                      const SizedBox(height: 7),
                                      Text(
                                        genre.buku?[bukuIndex].buku?.judul ??
                                            "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          }).toList()
                            ..addAll(
                                controller.dataKategoriList.map((kategori) {
                              return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        childAspectRatio: 1,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20),
                                itemCount: kategori.buku?.length ?? 0,
                                itemBuilder: (context, bukuIndex) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    padding: const EdgeInsets.all(7),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(8)),
                                              image: DecorationImage(
                                                image: (kategori
                                                                .buku?[
                                                                    bukuIndex]
                                                                .buku
                                                                ?.cover !=
                                                            null &&
                                                        kategori
                                                            .buku?[bukuIndex]
                                                            .buku
                                                            ?.cover!
                                                            .isNotEmpty)
                                                    ? base64Widget(kategori
                                                            .buku?[bukuIndex]
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
                                        const SizedBox(height: 7),
                                        Text(
                                          kategori.buku?[bukuIndex].buku
                                                  ?.judul ??
                                              "",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            }).toList()),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
