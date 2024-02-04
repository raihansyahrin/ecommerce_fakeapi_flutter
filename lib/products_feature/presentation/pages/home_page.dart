import 'package:ecommerce_motion_flutter/carts_feature/presentation/pages/carts_pages.dart';
import 'package:ecommerce_motion_flutter/products_feature/presentation/provider/products_provider.dart';
import 'package:ecommerce_motion_flutter/products_feature/presentation/widgets/filter_search_widget.dart';
import 'package:ecommerce_motion_flutter/products_feature/presentation/widgets/products_grid_widget.dart';

import 'package:ecommerce_motion_flutter/products_feature/presentation/widgets/search_field_widget.dart';
import 'package:ecommerce_motion_flutter/products_feature/presentation/widgets/selected_category_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(
        'Fetching products...'); // Ini akan dipanggil saat widget pertama kali dibuat
    // Pemanggilan getAllProducts dilakukan di dalam widget build
    // Future.delayed(Duration.zero, () {
    //   Provider.of<ProductsProvider>(context, listen: false).getAllProducts();
    // });

    var products = context.watch<ProductsProvider>().allProducts;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF292526),
        leadingWidth: 180,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Welcome',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              Text(
                'Raihan Syahrin',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartsPage(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 5,
                child: SearchFieldWidget(),
              ),
              Flexible(
                flex: 1,
                child: FilterSearchWidget(),
              ),
            ],
          ),
          const CategorySelector(),
          ProductsGridWidget(products: products),
        ],
      ),
    );
  }
}
