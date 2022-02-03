import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/user_products_screen.dart';
import '../screens/products_overview_screen.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: ThemeData(
            fontFamily: 'Lato',
            appBarTheme: const AppBarTheme(elevation: 2),
            colorScheme: ColorScheme(
                primary: Colors.blueGrey,
                secondary: Colors.deepOrange,
                brightness: Brightness.light,
                background: Colors.white,
                primaryVariant: Colors.purpleAccent,
                error: Colors.red,
                onBackground: Colors.black87,
                onError: Colors.white,
                onPrimary: Colors.white,
                onSecondary: Colors.white,
                onSurface: Colors.black87,
                secondaryVariant: Colors.deepOrange.shade700,
                surface: Colors.white)),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.id: (context) => const ProductDetailScreen(),
          CartScreen.id: (context) => const CartScreen(),
          OrdersScreen.id: (context) => const OrdersScreen(),
          UserProductsScreen.id: (context) => const UserProductsScreen(),
          EditProductScreen.id: (context) => const EditProductScreen(),
        },
      ),
    );
  }
}
