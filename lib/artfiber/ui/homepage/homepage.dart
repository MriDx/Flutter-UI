import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ui/artfiber/component/component.dart';
import 'package:ui/artfiber/ui/single_product_view/single_product_view.dart';
import 'package:ui/artfiber/utils/utils.dart';

const images = [
  'product/39_1609296552574.jpeg',
  'product/39_1609296560794.jpeg',
  'product/39_1609296536856.jpeg',
  'product/40_1609296701463.jpeg',
  'product/40_1609296689934.jpeg',
  'product/40_1609296680748.jpeg',
  'product/40_1609296671792.jpeg',
  'product/41_1609296852513.jpeg',
  'product/41_1609296838819.jpeg',
  'product/41_1609296828668.jpeg',
  'product/41_1609296820516.jpeg'
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Feeds',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              itemCount: images.length,
              primary: false,
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => SingleProductViewUI(images[index]),
                      ),
                    );
                  },
                  child: ItemView(images[index])),
              staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
            ),
          ),
        ],
      ),
    );
  }
}
