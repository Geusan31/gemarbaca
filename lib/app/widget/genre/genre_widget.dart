import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/model/response_book.dart';

class GenreWidget extends StatelessWidget {
  final List<GenreBukuRelasi> genres;

  const GenreWidget({super.key, required this.genres});
  @override
  Widget build(BuildContext context) {
    print(genres[0]);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: genres.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(right: 6),
          padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            genres[index].genreBuku?.nama ?? 'No Genre',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.0,
            ),
          ),
        );
      },
    );
  }
}
