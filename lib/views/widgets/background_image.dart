import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key, required this.imageURLParameter})
      : super(key: key);
  final String imageURLParameter;

  @override
  Widget build(BuildContext context) {
    String imageURL = imageURLParameter;
    AssetImage image = AssetImage(imageURL);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.fill,
          opacity: 150.0,
        ),
      ),
    );
  }
}
