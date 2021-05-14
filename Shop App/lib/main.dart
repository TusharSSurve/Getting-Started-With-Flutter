import 'package:flutter/material.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/product_detailed_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      child: MyApp(),
      create: (ctx) => Products(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato'),
      debugShowCheckedModeBanner: false,
      initialRoute: ProductOverviewScreen.routeName,
      routes: {
        ProductOverviewScreen.routeName: (ctx) => ProductOverviewScreen(),
        ProductDetailedScreen.routeName: (ctx) => ProductDetailedScreen()
      },
    );
  }
}
