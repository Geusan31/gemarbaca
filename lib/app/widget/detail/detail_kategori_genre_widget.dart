import 'package:flutter/material.dart';

class BukuGridView extends StatelessWidget {
  final String title;

  BukuGridView({required this.title});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(30, (index) {
        return Card(
          child: Center(child: Text('$title Buku $index')),
        );
      }),
    );
  }
}