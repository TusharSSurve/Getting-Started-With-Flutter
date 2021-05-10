import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final imageUrl;
  final categoryName;

  const CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            width: 120,
            height: 60,
          )
        ],
      ),
    );
  }
}
