import 'package:flutter/material.dart';

class KategoriWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final String image;
  const KategoriWidget(
      {Key? key, required this.image, required this.text, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
        ).copyWith(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) return Colors.transparent;
            return Colors.transparent;
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) return Colors.white;
            return Colors.transparent;
          }),
          elevation: MaterialStateProperty.resolveWith<double>((Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) return 0;
            return 0;
          }),
        ),
        onPressed: () {},
        child: Column(
          children: [
            Flexible(
              child: Image.asset(
                image,
                width: 40,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(text, style: TextStyle(fontSize: fontSize), overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }
}
