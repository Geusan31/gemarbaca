import 'package:flutter/material.dart';

class GenreCircleWidget extends StatelessWidget {
  final IconData icons;
  final String genreName;
  final VoidCallback onTap;
  const GenreCircleWidget({Key? key, required this.icons, required this.genreName, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(100)
            ),
            child: Icon(icons),
          ),
          Text(genreName),
        ],
      ),
    );
  }
}

