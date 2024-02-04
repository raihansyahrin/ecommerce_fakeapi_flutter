import 'package:ecommerce_motion_flutter/carts_feature/presentation/providers/carts_provider.dart';
import 'package:ecommerce_motion_flutter/products_feature/presentation/pages/home_page.dart';
import 'package:ecommerce_motion_flutter/products_feature/presentation/pages/products_detail_page.dart';
import 'package:ecommerce_motion_flutter/products_feature/presentation/provider/products_provider.dart';
import 'package:ecommerce_motion_flutter/products_feature/presentation/provider/selected_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SelectedCategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        )
      ],
      child: MaterialApp(
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
        routes: {
          ProductsDetailPage.routeName: (context) => const ProductsDetailPage(),
          "/homescreen": (_) => const HomePage(),
        },
      ),
    );
  }
}
