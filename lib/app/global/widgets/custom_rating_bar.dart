import 'package:flutter/material.dart';

class CustomRatingBar extends StatelessWidget {
  final double value;
  final double size;
  CustomRatingBar({Key? key, this.value = 0, required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return SizedBox(
          child: Icon(
            index < value ? Icons.star : Icons.star_border,
            color: Colors.yellow,
            size: size,
          ),
        );
      }),
    );
  }
}
