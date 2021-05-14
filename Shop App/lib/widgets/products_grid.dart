import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

import 'package:shop_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool _showOnlyFavorites;

  const ProductsGrid(this._showOnlyFavorites);

  @override
  Widget build(BuildContext context) {
    final productData = _showOnlyFavorites
        ? Provider.of<Products>(context).favoriteItems
        : Provider.of<Products>(context).items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: productData[index],
          child: ProductItem(),
        );
      },
      itemCount: productData.length,
      padding: const EdgeInsets.all(10),
    );
  }
}
