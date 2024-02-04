import 'package:flutter/material.dart';

class FilterSearchWidget extends StatelessWidget {
  const FilterSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      width: 49,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Color(0xFF292526),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: const Icon(
        Icons.filter_list_rounded,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}



// class ProductsPage extends StatefulWidget {
//   @override
//   _ProductsPageState createState() => _ProductsPageState();
// }

// class _ProductsPageState extends State<ProductsPage> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       print('Fetching products...');
//       Provider.of<ProductsProvider>(context, listen: false).getAllProducts();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ProductsWidget(),
//       // body: Consumer<ProductsProvider>(builder: (context, value, child) {
//       //   if (value.isLoading) {
//       //     return Center(
//       //       child: CircularProgressIndicator(),
//       //     );
//       //   }

//       //   final products = value.allProducts;
//       //   return ListView.builder(
//       //     itemCount: value.allProducts.length,
//       //     itemBuilder: (context, index) {
//       //       return ListTile(
//       //         title: Text(products[index].title),
//       //         subtitle: Text('${products[index].rating.count} \$'),
//       //       );
//       //     },
//       //   );
//       // }),
//     );
//   }
// }
