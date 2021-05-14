import 'package:flutter/material.dart';

class ProductDetailedScreen extends StatelessWidget {
  static const routeName = '/product_detail';
  // final String title;

  // const ProductDetailedScreen({this.title});
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
