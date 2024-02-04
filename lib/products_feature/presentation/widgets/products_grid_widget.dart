import 'package:ecommerce_motion_flutter/products_feature/data/models/products_model.dart';
import 'package:ecommerce_motion_flutter/products_feature/presentation/provider/products_provider.dart';
import 'package:ecommerce_motion_flutter/products_feature/presentation/provider/selected_category_provider.dart';
import 'package:ecommerce_motion_flutter/products_feature/presentation/widgets/item_products_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ProductsGridWidget extends StatefulWidget {
  const ProductsGridWidget({
    super.key,
    required this.products,
  });

  final List<ProductsModel> products;

  @override
  State<ProductsGridWidget> createState() => _ProductsGridWidgetState();
}

class _ProductsGridWidgetState extends State<ProductsGridWidget> {
  @override
  void initState() {
    // TODO: implement initState

    // Future.delayed(Duration.zero, () {
    //   Provider.of<ProductsProvider>(context, listen: false).getAllProducts();
    // });
    Future.microtask(() => context.read<ProductsProvider>().getAllProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedCategory = context
        .watch<SelectedCategoryProvider>()
        .categories[context.watch<SelectedCategoryProvider>().selectedIndex];

    List<ProductsModel> filteredProducts;

    final loadedProducts = context.watch<ProductsProvider>();
    final allProducts = loadedProducts.allProducts;

    if (selectedCategory == 'All Items') {
      // If "All" category is selected, display all products
      filteredProducts = allProducts;
    } else {
      filteredProducts = allProducts.where((product) {
        // Sesuaikan dengan kategori yang ada di API
        if (selectedCategory == 'Women\'s Clothing') {
          return (product.category).toLowerCase() == 'women\'s clothing';
        } else if (selectedCategory == 'Men\'s Clothing') {
          return (product.category).toLowerCase() == 'men\'s clothing';
        } else if (selectedCategory == 'Jewelery') {
          return (product.category).toLowerCase() == 'jewelery';
        } else if (selectedCategory == 'Electronics') {
          return (product.category).toLowerCase() == 'electronics';
        }
        return false;
      }).toList();
    }

    return MasonryGridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: filteredProducts.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, i) {
        return ProductsWidget(
          id: filteredProducts[i].id,
          image: filteredProducts[i].image,
          category: filteredProducts[i].category,
          price: filteredProducts[i].price,
          rate: filteredProducts[i].rating.rate,
          title: filteredProducts[i].title,
        );
        // return ProductsWidget(
        //   image: widget.products[i].image,
        //   category: widget.products[i].category,
        //   price: widget.products[i].price,
        //   rate: widget.products[i].rating.rate,
        //   title: widget.products[i].title,
        // );
      },
    );
  }
}
