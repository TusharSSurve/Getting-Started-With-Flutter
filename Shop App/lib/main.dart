import 'package:flutter/material.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/auth_screen.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/product_detailed_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/user_products_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (ctx) => Products(),
      ),
      ChangeNotifierProvider(
        create: (ctx) => Cart(),
      ),
      ChangeNotifierProvider(
        create: (ctx) => Orders(),
      ),
      ChangeNotifierProvider(
        create: (ctx) => Auth(),
      ),
    ],
    child: MyApp(),
  ));
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
      initialRoute: AuthScreen.routeName,
      routes: {
        ProductOverviewScreen.routeName: (ctx) => ProductOverviewScreen(),
        ProductDetailedScreen.routeName: (ctx) => ProductDetailedScreen(),
        CartScreen.routeName: (ctx) => CartScreen(),
        OrdersScreen.routeName: (ctx) => OrdersScreen(),
        UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
        EditProductScreen.routeName: (ctx) => EditProductScreen(),
        AuthScreen.routeName: (ctx) => AuthScreen()
      },
    );
  }
}
