import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/model/response_books_by_peminjaman.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';
import 'package:gemarbaca/app/widget/base64/base64_widget.dart';
import 'package:gemarbaca/app/widget/genre/genre_widget.dart';
import 'package:gemarbaca/app/widget/genrecircle/genre_circle_widget.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

import '../controllers/search_controller.dart' as SearchControllerr;

class SearchView extends GetView<SearchControllerr.SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
              width: double.infinity,
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                controller: controller.searchController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    suffixIcon: Icon(Icons.search, color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    hintStyle: new TextStyle(color: Colors.black38),
                    hintText: "Search"),
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Buku Teratas",
                        style:
                            TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      Expanded(
                        child: Obx(() {
                          return ListView.builder(
                              itemCount:
                                  controller.dataBookByPeminjamanList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    radius: 13.0,
                                    backgroundColor: index == 0
                                        ? const Color(0xffD4af37)
                                        : index == 1
                                            ? Colors.grey.shade400
                                            : index == 2
                                                ? Colors.brown
                                                : Colors.red,
                                    child: Text('${index + 1}'),
                                  ),
                                  title: Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: (controller
                                                            .dataBookByPeminjamanList[
                                                                index]
                                                            .cover !=
                                                        null &&
                                                    controller
                                                        .dataBookByPeminjamanList[
                                                            index]
                                                        .cover!
                                                        .isNotEmpty)
                                                ? base64Widget(controller
                                                        .dataBookByPeminjamanList[
                                                            index]
                                                        .cover ??
                                                    "")
                                                : const AssetImage(
                                                    "assets/img/default/default_image.png"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(controller
                                                    .dataBookByPeminjamanList[
                                                        index]
                                                    .judul ??
                                                ''),
                                            Visibility(
                                              visible: controller
                                                      .dataBookByPeminjamanList[
                                                          index]
                                                      .genreBuku
                                                      ?.isNotEmpty ??
                                                  false,
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                height: 19,
                                                child: GenreWidget<
                                                    BookByPeminjamanGenreBukuRelasi>(
                                                  genres: controller
                                                          .dataBookByPeminjamanList[
                                                              index]
                                                          .genreBuku ??
                                                      [],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Genre Favorit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        Container(
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Obx(() {
                              return GridView.builder(
                                  itemCount: math.min(9, controller.dataGenreByPeminjamanList.length), // gunakan jumlah item yang lebih kecil antara 9 dan jumlah genre
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4, // jumlah kolom
                                      childAspectRatio: 1, // rasio lebar/tinggi untuk setiap item
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20
                                  ),
                                  itemBuilder: (context, index) {
                                    var genre = controller.dataGenreByPeminjamanList[index];
                                    return GenreCircleWidget(
                                      icons: controller.getIconForGenre(genre.genre ?? 'Unknown'),
                                      genreName: genre.genre ?? 'Unknown',
                                      onTap: () {
                                        Get.offAllNamed(Routes.LAYOUT, arguments: genre.genre);
                                      }
                                    );
                                  }
                              );
                            }),
                          )
                        )
                      ]
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
