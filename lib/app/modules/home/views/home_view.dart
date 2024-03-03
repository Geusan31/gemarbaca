import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gemarbaca/app/widget/base64/base64_widget.dart';
import 'package:gemarbaca/app/widget/genre/genre_widget.dart';
import 'package:gemarbaca/app/widget/kategori/kategori_widget.dart';
import 'package:gemarbaca/app/widget/newbookloading/newbookloading_widget.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50.0),
                        child: Image.asset(
                          'assets/img/logo/logo.png',
                          width: 35,
                        ),
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
                      )
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search, size: 25,),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white60))),
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none_outlined, size: 25,),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white60))),
                  ],
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Ada yang baru nih!",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(() {
                        if (controller.dataBookList.isEmpty) {
                          return const Center(
                            child: Text(
                              'Data tidak ada',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: 190,
                            child: controller.status.value == RxStatus.loading()
                                ? const ShimmerList()
                                : ListView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(5),
                                    itemCount: controller.dataBookList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(right: 15),
                                        width: 350,
                                        height: 190,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  blurRadius: 1,
                                                  spreadRadius: 0,
                                                  offset: const Offset(2, 2))
                                            ]),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 115,
                                              height: 190,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(8)),
                                                image: DecorationImage(
                                                  image: (controller
                                                                  .dataBookList[
                                                                      index]
                                                                  .cover !=
                                                              null &&
                                                          controller
                                                              .dataBookList[
                                                                  index]
                                                              .cover!
                                                              .isNotEmpty)
                                                      ? base64Widget(controller
                                                              .dataBookList[
                                                                  index]
                                                              .cover ??
                                                          "")
                                                      : const AssetImage(
                                                          "assets/img/default/default_image.png"),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      controller
                                                              .dataBookList[
                                                                  index]
                                                              .judul ??
                                                          "",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  RatingBarIndicator(
                                                    rating: (controller
                                                                    .dataBookList[
                                                                        index]
                                                                    .ulasan !=
                                                                null &&
                                                            controller
                                                                .dataBookList[
                                                                    index]
                                                                .ulasan!
                                                                .isNotEmpty)
                                                        ? (controller
                                                                        .dataBookList[
                                                                            index]
                                                                        .ulasan![
                                                                    0]['rating']
                                                                as double?) ??
                                                            0
                                                        : 0,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    itemCount: 5,
                                                    itemSize: 20.0,
                                                    direction: Axis.horizontal,
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(vertical: 5),
                                                    height: 19,
                                                    child: GenreWidget(
                                                      genres: controller
                                                              .dataBookList[
                                                                  index]
                                                              .genreBuku ??
                                                          [],
                                                    ),
                                                  ),
                                                  Text(
                                                      controller
                                                              .dataBookList[
                                                                  index]
                                                              .deskripsi ??
                                                          "",
                                                      maxLines: 4,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                          );
                        }
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Kategori",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 25),
                        width: double.infinity,
                        height: 60,
                        child: Row(
                          children: const [
                            KategoriWidget(
                              image: "assets/img/kategori_icon/novel.png",
                              text: "Novel", fontSize: 12,),
                            KategoriWidget(
                              image: "assets/img/kategori_icon/comic.png",
                              text: "Komik", fontSize: 12,),
                            KategoriWidget(
                              image: "assets/img/kategori_icon/education.png",
                              text: "Pengetahuan",fontSize: 10, ),
                            KategoriWidget(
                              image: "assets/img/kategori_icon/other.png",
                              text: "Lainnya", fontSize: 12,),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Riwayat Baca",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: ElevatedButton.icon(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  elevation: MaterialStateProperty.all(0),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  size: 12,
                                ),
                                label: const Text("Lainnya")),
                          ),
                        ],
                      ),
                      Obx(() {
                        if (controller.dataRiwayatList.isEmpty) {
                          return const Center(
                            child: Text(
                              'Data tidak ada',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: 190,
                            child: ListView.builder(
                              padding: const EdgeInsets.all(5),
                              itemCount: controller.dataRiwayatList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
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
                                              image: (controller
                                                              .dataRiwayatList[
                                                                  index]
                                                              .peminjaman
                                                              ?.buku
                                                              ?.cover !=
                                                          null &&
                                                      controller
                                                          .dataRiwayatList[
                                                              index]
                                                          .peminjaman
                                                          ?.buku
                                                          ?.cover!
                                                          .isNotEmpty)
                                                  ? base64Widget(controller
                                                          .dataRiwayatList[
                                                              index]
                                                          .peminjaman
                                                          ?.buku
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
                                        controller.dataRiwayatList[index]
                                                .peminjaman?.buku?.judul ??
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
                            ),
                          );
                        }
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Rekomendasi",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: ElevatedButton.icon(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  elevation: MaterialStateProperty.all(0),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  size: 12,
                                ),
                                label: const Text("Lainnya")),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 220,
                        width: double.infinity,
                        child: Obx(() {
                          if (controller.dataPopulerBookList.isEmpty) {
                            return const Center(
                              child: Text(
                                'Data tidak ada',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            );
                          } else {
                            return SizedBox(
                              height: 190,
                              child: controller.status.value ==
                                      RxStatus.loading()
                                  ? const ShimmerList()
                                  : ListView.builder(
                                      padding: const EdgeInsets.all(5),
                                      itemCount:
                                          controller.dataPopulerBookList.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        if (index <
                                                controller.dataPopulerBookList
                                                    .length &&
                                            controller
                                                    .dataPopulerBookList[index]
                                                    .peminjaman !=
                                                null &&
                                            controller
                                                .dataPopulerBookList[index]
                                                .peminjaman!
                                                .isNotEmpty &&
                                            controller
                                                    .dataPopulerBookList[index]
                                                    .peminjaman![0]
                                                    .buku !=
                                                null) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                right: 15),
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
                                                    width: 120,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  8)),
                                                      image: DecorationImage(
                                                        image: (controller
                                                                        .dataPopulerBookList[
                                                                            index]
                                                                        .peminjaman![
                                                                            0]
                                                                        .buku!
                                                                        .cover !=
                                                                    null &&
                                                                controller
                                                                    .dataPopulerBookList[
                                                                        index]
                                                                    .peminjaman![
                                                                        0]
                                                                    .buku!
                                                                    .cover!
                                                                    .isNotEmpty)
                                                            ? base64Widget(controller
                                                                    .dataPopulerBookList[
                                                                        index]
                                                                    .peminjaman![
                                                                        0]
                                                                    .buku!
                                                                    .cover ??
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
                                                          .dataPopulerBookList[
                                                              index]
                                                          .peminjaman![0]
                                                          .buku!
                                                          .judul ??
                                                      "",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          );
                                        } else {
                                          return const SizedBox.shrink();
                                        }
                                      },
                                    ),
                            );
                          }
                        }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Top Rating",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: ElevatedButton.icon(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  elevation: MaterialStateProperty.all(0),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  size: 12,
                                ),
                                label: const Text("Lainnya")),
                          ),
                        ],
                      ),
                      Obx(() {
                        if (controller.dataHighRateBookList.isEmpty) {
                          return const Center(
                            child: Text(
                              'Data tidak ada',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: 190,
                            child: ListView.builder(
                              padding: const EdgeInsets.all(5),
                              itemCount: controller.dataHighRateBookList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
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
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8)),
                                            image: DecorationImage(
                                              image: (controller
                                                              .dataHighRateBookList[
                                                                  index]
                                                              .buku
                                                              ?.cover !=
                                                          null &&
                                                      controller
                                                          .dataHighRateBookList[
                                                              index]
                                                          .buku
                                                          ?.cover!
                                                          .isNotEmpty)
                                                  ? base64Widget(controller
                                                          .dataHighRateBookList[
                                                              index]
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
                                        controller.dataHighRateBookList[index]
                                                .buku?.judul ??
                                            "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
