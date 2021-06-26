import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ui/artfiber/component/component.dart';
import 'package:ui/artfiber/ui/homepage/homepage.dart';

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saved',
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
              itemBuilder: (context, index) => ItemView(images[index]),
              staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
            ),
          ),
        ],
      ),
    );
  }
}
