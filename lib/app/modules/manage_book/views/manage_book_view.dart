import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/manage_book_controller.dart';

class ManageBookView extends GetView<ManageBookController> {
  const ManageBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD Buku'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.CREATE_BOOK);
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(CupertinoIcons.create, color: Colors.green),
                  title: Text('Tambah Buku'),
                  subtitle:
                      Text('Tambahkan buku apapun di aplikasi Gemar Baca.'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Card(
                child: ListTile(
                  leading: Icon(CupertinoIcons.book_fill, color: Colors.yellow),
                  title: Text('Edit Buku'),
                  subtitle: Text('Update buku apapun di aplikasi Gemar Baca.'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Card(
                child: ListTile(
                  leading: Icon(CupertinoIcons.book_fill, color: Colors.red),
                  title: Text('Delete Buku'),
                  subtitle: Text('Hapus buku apapun di aplikasi Gemar Baca.'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
