import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/model/response_book.dart';
import 'package:gemarbaca/app/data/model/response_books_by_peminjaman.dart';
import 'package:gemarbaca/app/data/model/response_detail_book.dart';
import 'package:gemarbaca/app/data/model/response_user_koleksi.dart';
import 'package:gemarbaca/app/data/model/response_user_peminjaman_riwayat.dart';

class GenreWidget<T> extends StatelessWidget {
  final List<T> genres;
  const GenreWidget({super.key, required this.genres});
  @override
  Widget build(BuildContext context) {
    if (genres.isNotEmpty) {
      print(genres[0]);
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length > 3 ? 3 : genres.length,
        itemBuilder: (context, index) {
          String genreName;
          if(genres[0] is GenreBukuRelasi) {
            genreName = (genres[index] as GenreBukuRelasi).genreBuku?.nama ?? "No Genre";
          } else if(genres[0] is KoleksiGenreBukuRelasi) {
            genreName = (genres[index] as KoleksiGenreBukuRelasi).genreBuku?.nama ?? "No Genre";
          } else if(genres[0] is PeminjamanGenreBukuRelasi) {
            genreName = (genres[index] as PeminjamanGenreBukuRelasi).genreBuku?.nama ?? "No Genre";
          } else if(genres[0] is BookByPeminjamanGenreBukuRelasi) {
            genreName = (genres[index] as BookByPeminjamanGenreBukuRelasi).genreBuku?.nama ?? "No Genre";
          } else if(genres[0] is DetailBukuGenreBukuRelasi) {
            genreName = (genres[index] as DetailBukuGenreBukuRelasi).genreBuku?.nama ?? "No Genre";
          } else {
            genreName = 'No Genre';
          }
          return Container(
            margin: EdgeInsets.only(right: 6),
            padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Text(
              genreName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
