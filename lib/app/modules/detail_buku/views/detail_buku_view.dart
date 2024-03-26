import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gemarbaca/app/data/model/response_detail_book.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';
import 'package:gemarbaca/app/widget/base64/base64_widget.dart';
import 'package:gemarbaca/app/widget/genre/genre_widget.dart';

import 'package:get/get.dart';

import '../controllers/detail_buku_controller.dart';

// class DetailBukuView extends GetView<DetailBukuController> {
//   const DetailBukuView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (controller.status.value.isLoading) {
//         return const Scaffold(
//             body: Center(
//           child: CircularProgressIndicator(),
//         ));
//       } else {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(controller.dataDetailBukuList.value?.judul ?? '',
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//           ),
//           body: SingleChildScrollView(
//             child: Stack(
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 250,
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                         image: (controller.dataDetailBukuList.value?.cover !=
//                                     null &&
//                                 controller.dataDetailBukuList.value!.cover!
//                                     .isNotEmpty)
//                             ? base64Widget(
//                                 controller.dataDetailBukuList.value!.cover ??
//                                     "")
//                             : const AssetImage(
//                                 "assets/img/default/default_image.png"),
//                         fit: BoxFit.cover,
//                       )),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                                 colors: [Colors.transparent, Colors.white],
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter)),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   (controller.dataDetailBukuList.value
//                                               ?.avgRating ??
//                                           '0')
//                                       .toString(),
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16),
//                                 ),
//                                 Icon(CupertinoIcons.star_fill,
//                                     color: Colors.amber)
//                               ],
//                             ),
//                             Text('Rating')
//                           ],
//                         ),
//                         SizedBox(
//                           width: 100,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             controller.koleksi();
//                           },
//                           child: Column(
//                             children: [
//                               Icon(CupertinoIcons.bookmark),
//                               Text('Bookmark')
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     DefaultTabController(
//                       length: 2,
//                       child: Scaffold(
//                         appBar: AppBar(
//                           title: TabBar(
//                             tabs: [
//                               Tab(text: 'Detail'),
//                               Tab(text: 'Episode'),
//                             ],
//                           ),
//                         ),
//                         body: TabBarView(
//                           children: [
//                             Container(
//                               width: MediaQuery.of(context).size.width,
//                               padding: EdgeInsets.symmetric(horizontal: 30),
//                               margin: const EdgeInsets.only(top: 90.0),
//                               child: SingleChildScrollView(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'Detail',
//                                       style: TextStyle(
//                                           fontSize: 20, fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                         width: 20,
//                                         child: Divider(
//                                             height: 2.0,
//                                             color: Theme.of(context).primaryColor)),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Text(
//                                       "Sinopsis",
//                                       style: TextStyle(
//                                           fontSize: 20, fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       height: 7,
//                                     ),
//                                     Text(
//                                       controller.dataDetailBukuList.value?.deskripsi ??
//                                           '-',
//                                       style: TextStyle(fontSize: 16),
//                                     ),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Text(
//                                       "Author",
//                                       style: TextStyle(
//                                           fontSize: 20, fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       height: 7,
//                                     ),
//                                     Text(
//                                       controller.dataDetailBukuList.value?.penulis ??
//                                           '-',
//                                       style: TextStyle(fontSize: 16),
//                                     ),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Text(
//                                       "Genres",
//                                       style: TextStyle(
//                                           fontSize: 20, fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       height: 7,
//                                     ),
//                                     GenreWidget<DetailBukuGenreBukuRelasi>(
//                                         genres: controller
//                                             .dataDetailBukuList.value!.genreBuku ??
//                                             []),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Text(
//                                       "Tahun",
//                                       style: TextStyle(
//                                           fontSize: 20, fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       height: 7,
//                                     ),
//                                     Text(
//                                       controller.dataDetailBukuList.value?.tahunTerbit
//                                           .toString() ??
//                                           '-',
//                                       style: TextStyle(fontSize: 16),
//                                     ),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Text(
//                                       "Ulasan",
//                                       style: TextStyle(
//                                           fontSize: 20, fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       height: 8,
//                                     ),
//                                     Obx(() {
//                                       return (controller.dataDetailBukuList.value
//                                           ?.ulasan?.isEmpty ??
//                                           true)
//                                           ? const Text('No reviews available')
//                                           : Column(
//                                         children: controller
//                                             .dataDetailBukuList.value?.ulasan
//                                             ?.map((ulasan) {
//                                           return Row(children: [
//                                             CircleAvatar(),
//                                             SizedBox(
//                                               width: 20,
//                                             ),
//                                             Column(
//                                                 crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                                 children: [
//                                                   Row(
//                                                       crossAxisAlignment:
//                                                       CrossAxisAlignment
//                                                           .center,
//                                                       children: [
//                                                         Text(
//                                                             ulasan.user!
//                                                                 .namaLengkap ??
//                                                                 '-',
//                                                             style: TextStyle(
//                                                                 fontWeight:
//                                                                 FontWeight
//                                                                     .w600)),
//                                                         SizedBox(
//                                                           width: 10,
//                                                         ),
//                                                         RatingBarIndicator(
//                                                           rating: ulasan
//                                                               .rating
//                                                               ?.toDouble() ??
//                                                               0,
//                                                           itemBuilder:
//                                                               (context,
//                                                               index) =>
//                                                           const Icon(
//                                                             Icons.star,
//                                                             color:
//                                                             Colors.amber,
//                                                           ),
//                                                           itemCount: 5,
//                                                           itemSize: 15.0,
//                                                           direction:
//                                                           Axis.horizontal,
//                                                         ),
//                                                       ]),
//                                                   Text(ulasan.ulasan ?? '')
//                                                 ])
//                                           ]);
//                                         }).toList() ??
//                                             [],
//                                       );
//                                     }),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             ListView.builder(
//                               itemCount: 10, // replace with your actual list length
//                               itemBuilder: (context, index) {
//                                 return ListTile(
//                                   title: Text('Episode ${index + 1}'), // replace with your actual data
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Positioned(
//                   top: MediaQuery.of(context).size.height / 8,
//                   left: MediaQuery.of(context).size.width / 2.9,
//                   child: Column(
//                     children: [
//                       Container(
//                         width: 130,
//                         height: 200,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                           image: (controller.dataDetailBukuList.value?.cover !=
//                                       null &&
//                                   controller.dataDetailBukuList.value!.cover!
//                                       .isNotEmpty)
//                               ? base64Widget(
//                                   controller.dataDetailBukuList.value!.cover ??
//                                       "")
//                               : const AssetImage(
//                                   "assets/img/default/default_image.png"),
//                           fit: BoxFit.cover,
//                         )),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(controller.dataDetailBukuList.value?.judul ?? '',
//                           style: TextStyle(
//                               fontSize: 23, fontWeight: FontWeight.bold))
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           bottomNavigationBar: BottomAppBar(
//             color: Colors.transparent,
//             elevation: 0,
//             child: Padding(
//               padding: EdgeInsets.all(8.0),
//               child: TextButton(
//                 onPressed: () {
//                   if (controller.statusPeminjaman.value) {
//                     Get.toNamed(Routes.BACA, parameters: {
//                       'judul': controller.dataDetailBukuList.value?.judul.toString() ?? '-',
//                       'file': controller.dataDetailBukuList.value?.file
//                     });
//                   } else {
//                     controller.alertShow();
//                   }
//                 },
//                 child: Obx(() {
//                   return Text(controller.statusPeminjaman.value ? 'Baca Buku' : 'Pinjam Buku', style: TextStyle(color: Colors.white));
//                 }),
//                 style: TextButton.styleFrom(
//                     backgroundColor: Theme.of(context).primaryColor,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10))),
//               ),
//             ),
//           ),
//         );
//       }
//     });
//   }
// }

class DetailBukuView extends GetView<DetailBukuController> {
  const DetailBukuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.status.value.isLoading) {
        return const Scaffold(
            body: Center(
          child: CircularProgressIndicator(),
        ));
      } else {
        return DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  title: Text(controller.dataDetailBukuList.value?.judul ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                body: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: (controller.dataDetailBukuList.value
                                              ?.cover !=
                                          null &&
                                      controller.dataDetailBukuList.value!
                                          .cover!.isNotEmpty)
                                  ? base64Widget(controller
                                          .dataDetailBukuList.value!.cover ??
                                      "")
                                  : const AssetImage(
                                      "assets/img/default/default_image.png"),
                              fit: BoxFit.cover,
                            )),
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                    Colors.transparent,
                                    Colors.white
                                  ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        (controller.dataDetailBukuList.value
                                                    ?.avgRating ??
                                                '0')
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Icon(CupertinoIcons.star_fill,
                                          color: Colors.amber)
                                    ],
                                  ),
                                  Text('Rating')
                                ],
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.koleksi();
                                },
                                child: Column(
                                  children: [
                                    Icon(CupertinoIcons.bookmark),
                                    Text('Bookmark')
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 90),
                            child: TabBar(
                              tabs: [
                                Tab(text: 'Detail'),
                                Tab(text: 'Episode'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height,
                            child: TabBarView(
                              children: [
                                SingleChildScrollView(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    // height: Get.height,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    margin: EdgeInsets.only(top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Detail',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width: 20,
                                            child: Divider(
                                                height: 2.0,
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Sinopsis",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          controller.dataDetailBukuList.value
                                                  ?.deskripsi ??
                                              '-',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Author",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          controller.dataDetailBukuList.value
                                                  ?.penulis ??
                                              '-',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Genres",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        GenreWidget<DetailBukuGenreBukuRelasi>(
                                            genres: controller
                                                    .dataDetailBukuList
                                                    .value!
                                                    .genreBuku ??
                                                []),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Tahun",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          controller.dataDetailBukuList.value
                                                  ?.tahunTerbit
                                                  .toString() ??
                                              '-',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Ulasan",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Obx(() {
                                          return (controller.dataDetailBukuList
                                                      .value?.ulasan?.isEmpty ??
                                                  true)
                                              ? const Text(
                                                  'No reviews available')
                                              : Column(
                                                  children: controller
                                                          .dataDetailBukuList
                                                          .value
                                                          ?.ulasan
                                                          ?.map((ulasan) {
                                                        return Row(children: [
                                                          CircleAvatar(),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                          ulasan.user!.namaLengkap ??
                                                                              '-',
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.w600)),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      RatingBarIndicator(
                                                                        rating:
                                                                            ulasan.rating?.toDouble() ??
                                                                                0,
                                                                        itemBuilder:
                                                                            (context, index) =>
                                                                                const Icon(
                                                                          Icons
                                                                              .star,
                                                                          color:
                                                                              Colors.amber,
                                                                        ),
                                                                        itemCount:
                                                                            5,
                                                                        itemSize:
                                                                            15.0,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                      ),
                                                                    ]),
                                                                Text(ulasan
                                                                        .ulasan ??
                                                                    '')
                                                              ])
                                                        ]);
                                                      }).toList() ??
                                                      [],
                                                );
                                        }),
                                      ],
                                    ),
                                  ),
                                ),
                                (controller.dataDetailBukuList.value?.episode ==
                                            null ||
                                        controller.dataDetailBukuList.value!
                                            .episode!.isEmpty)
                                    ? Center(
                                        child: Text("Tidak ada episode"),
                                      )
                                    : ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: controller.dataDetailBukuList
                                            .value?.episode?.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            onTap: () {
                                              if (controller
                                                  .statusPeminjaman.value) {
                                                Get.toNamed(Routes.BACA,
                                                    parameters: {
                                                      'judul': controller
                                                              .dataDetailBukuList
                                                              .value
                                                              ?.judul
                                                              .toString() ??
                                                          '-',
                                                      'file': controller
                                                          .dataDetailBukuList
                                                          .value
                                                          ?.episode?[index]
                                                          .file
                                                    });
                                              } else {
                                                controller.alertShow();
                                              }
                                            },
                                            title: Text(controller
                                                    .dataDetailBukuList
                                                    .value
                                                    ?.episode![index]
                                                    .judul ??
                                                ''),
                                          );
                                        },
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 8,
                        left: MediaQuery.of(context).size.width / 2.9,
                        child: Column(
                          children: [
                            Container(
                              width: 130,
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: (controller.dataDetailBukuList.value
                                                ?.cover !=
                                            null &&
                                        controller.dataDetailBukuList.value!
                                            .cover!.isNotEmpty)
                                    ? base64Widget(controller
                                            .dataDetailBukuList.value!.cover ??
                                        "")
                                    : const AssetImage(
                                        "assets/img/default/default_image.png"),
                                fit: BoxFit.cover,
                              )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                controller.dataDetailBukuList.value?.judul ??
                                    '',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: BottomAppBar(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        if (controller.statusPeminjaman.value) {
                          Get.toNamed(Routes.BACA, parameters: {
                            'judul': controller.dataDetailBukuList.value?.judul
                                    .toString() ??
                                '-',
                            'file': controller
                                .dataDetailBukuList.value?.episode?[0].file
                          });
                        } else {
                          controller.alertShow();
                        }
                      },
                      child: Obx(() {
                        return Text(
                            controller.statusPeminjaman.value
                                ? 'Baca Buku'
                                : 'Pinjam Buku',
                            style: TextStyle(color: Colors.white));
                      }),
                      style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                )));
      }
    });
  }
}
