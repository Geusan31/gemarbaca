import 'package:flutter/material.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';
import 'package:gemarbaca/app/widget/base64/base64_widget.dart';

import 'package:get/get.dart';

import '../controllers/list_book_edit_controller.dart';

class ListBookEditView extends GetView<ListBookEditController> {
  const ListBookEditView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Buku'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(() {
                  return controller.status.value.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : controller.dataBookList.isEmpty
                          ? const SizedBox(
                              height: 190,
                              child: Center(
                                child: Text(
                                  'Data tidak ada',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 190,
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  await controller.getBuku();
                                  controller.update();
                                },
                                child: ListView.builder(
                                  itemCount: controller.dataBookList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      trailing: SizedBox(
                                        width: 150,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Get.toNamed(Routes.EDIT_BOOK,
                                                      parameters: {
                                                        "id": controller
                                                            .dataBookList[index]
                                                            .bukuID
                                                            .toString()
                                                      });
                                                },
                                                child: const Icon(
                                                  Icons.edit,
                                                )),
                                            ElevatedButton(
                                                onPressed: () {
                                                  controller.deleteBook(
                                                      controller
                                                          .dataBookList[index]
                                                          .bukuID
                                                          .toString());
                                                },
                                                child: const Icon(
                                                  Icons.delete,
                                                )),
                                          ],
                                        ),
                                      ),
                                      title: Text(
                                        controller.dataBookList[index].judul!,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      leading: Image(
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                      ),
                                    );
                                  },
                                ),
                              ));
                }),
              ],
            ),
          ),
        ));
  }
}
