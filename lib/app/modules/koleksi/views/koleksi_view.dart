import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/model/response_user_peminjaman_riwayat.dart';
import 'package:gemarbaca/app/widget/base64/base64_widget.dart';
import 'package:gemarbaca/app/widget/genre/genre_widget.dart';

import 'package:get/get.dart';

import '../../../data/model/response_user_koleksi.dart';
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
                      widthFactor: 0.7,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: Theme.of(context).colorScheme.copyWith(
                                surfaceVariant: Colors.transparent,
                              ),
                        ),
                        child: TabBar(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            physics: const ClampingScrollPhysics(),
                            padding: EdgeInsets.only(
                                top: 10, left: 10, right: 10, bottom: 10),
                            unselectedLabelColor:
                                Theme.of(context).primaryColor,
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
                                          color: Theme.of(context)
                                              .primaryColorLight)),
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
                                          color: Theme.of(context)
                                              .primaryColorLight)),
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
                    RefreshIndicator(
                      onRefresh: controller.getKoleksi,
                      child: Obx(() {
                        return ListView.builder(
                          padding: const EdgeInsets.all(5),
                          itemCount: controller.dataUserKoleksiList.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            log("Index: $index");
                            log("Length: ${controller.dataUserKoleksiList.length}");
                            return Container(
                              margin: const EdgeInsets.only(right: 15),
                              width: 350,
                              height: 180,
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Container(
                                    width: 115,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      image: DecorationImage(
                                        image: (controller
                                            .dataUserKoleksiList[
                                        index]
                                            .buku
                                            ?.cover !=
                                            null &&
                                            controller
                                                .dataUserKoleksiList[
                                            index]
                                                .buku!
                                                .cover!
                                                .isNotEmpty)
                                            ? base64Widget(controller
                                            .dataUserKoleksiList[
                                        index]
                                            .buku!
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
                                                .dataUserKoleksiList[
                                            index]
                                                .buku!
                                                .judul ??
                                                "",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        Visibility(
                                          visible: controller
                                              .dataUserKoleksiList[index]
                                              .buku
                                              ?.genreBuku
                                              ?.isNotEmpty ??
                                              false,
                                          child: Container(
                                            margin:
                                            const EdgeInsets.symmetric(
                                                vertical: 5),
                                            height: 19,
                                            child: GenreWidget<
                                                KoleksiGenreBukuRelasi>(
                                              genres: controller
                                                  .dataUserKoleksiList[
                                              index]
                                                  .buku
                                                  ?.genreBuku ??
                                                  [],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 3),
                                          child: Text(
                                              controller
                                                  .dataUserKoleksiList[
                                              index]
                                                  .buku
                                                  ?.deskripsi ??
                                                  "",
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.normal)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }),
                    ),
                    RefreshIndicator(
                      onRefresh: controller.getKoleksi,
                      child: Obx(() {
                        return ListView.builder(
                          padding: const EdgeInsets.all(5),
                          itemCount: controller.dataUserPeminjamanList.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            log("Index: $index");
                            log("Length: ${controller.dataUserPeminjamanList.length}");
                            return Container(
                              margin: const EdgeInsets.only(right: 15),
                              width: 350,
                              height: 180,
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Container(
                                    width: 115,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      image: DecorationImage(
                                        image: (controller
                                            .dataUserPeminjamanList[
                                        index]
                                            .buku
                                            ?.cover !=
                                            null &&
                                            controller
                                                .dataUserPeminjamanList[
                                            index]
                                                .buku!
                                                .cover!
                                                .isNotEmpty)
                                            ? base64Widget(controller
                                            .dataUserPeminjamanList[
                                        index]
                                            .buku!
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
                                                .dataUserPeminjamanList[
                                            index]
                                                .buku!
                                                .judul ??
                                                "",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        Visibility(
                                          visible: controller
                                              .dataUserPeminjamanList[index]
                                              .buku
                                              ?.genreBuku
                                              ?.isNotEmpty ??
                                              false,
                                          child: Container(
                                            margin:
                                            const EdgeInsets.symmetric(
                                                vertical: 5),
                                            height: 19,
                                            child: GenreWidget<
                                                PeminjamanGenreBukuRelasi>(
                                              genres: controller.dataUserPeminjamanList[index].buku?.genreBuku ??
                                                  [],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 3),
                                          child: Text(
                                              controller
                                                  .dataUserPeminjamanList[
                                              index]
                                                  .buku
                                                  ?.deskripsi ??
                                                  "",
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.normal)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
