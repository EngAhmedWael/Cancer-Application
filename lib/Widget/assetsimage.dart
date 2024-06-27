import 'package:flutter/material.dart';

class Assetimage extends StatelessWidget {
  const Assetimage({super.key, required this.image, required this.heigh});
  final AssetImage image;
  final double heigh;
  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      width: double.infinity,
      fit: BoxFit.fill,
      height: heigh,
    );
  }
}
