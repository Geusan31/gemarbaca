import 'package:flutter/material.dart';
// import 'package:gemarbaca/app/data/model/response_genre.dart' as responseGenre;
// import 'package:gemarbaca/app/data/model/response_kategori.dart' as responseKategori;

class BukuGridView extends StatelessWidget {
  final List<Map<String, dynamic>> bukuList;

  BukuGridView({required this.bukuList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: bukuList.length,
      itemBuilder: (context, index) {
        final buku = bukuList[index];
        String cover = buku['cover'] ?? '';
        String judul = buku['judul'] ?? '';

        return InkWell(
          onTap: () {},
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cover.isNotEmpty
                    ? Image.network(
                        cover,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    : SizedBox.shrink(),
                judul.isNotEmpty ? Text(judul) : SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }
}
