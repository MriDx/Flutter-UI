import 'package:flutter/material.dart';
import 'package:ui/artfiber/utils/utils.dart';

class ItemView extends StatelessWidget {
  final String image;
  double height;
  ItemView(this.image);
  ItemView.height(this.image, {this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://aiishop.in/${image}',
                fit: BoxFit.fill,
                height: height,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
