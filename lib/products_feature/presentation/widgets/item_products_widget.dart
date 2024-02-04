import 'package:ecommerce_motion_flutter/products_feature/presentation/pages/products_detail_page.dart';
import 'package:flutter/material.dart';

class ProductsWidget extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final String category;
  final double price;
  final double rate;

  const ProductsWidget(
      {Key? key,
      required this.id,
      required this.image,
      required this.title,
      required this.category,
      required this.price,
      required this.rate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductsDetailPage.routeName,
          arguments: id,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    image,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF292526),
                      child: Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.white,
                        size: 27,
                        // color: Colors.amber,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    category,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 148, 148, 148)),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$$price',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                Icons.star,
                                size: 26,
                                color: Colors.amber,
                              ),
                            ),
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: SizedBox(width: 5),
                            ),
                            TextSpan(
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                              text: '$rate',
                            ),
                          ],
                        ),
                      )
                      // Text('${rate}'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

    // return ListView.builder(
    //   itemCount: products.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: Text(products[index].category),
    //       subtitle: Text(products[index].description),
    //       // Add more fields as needed
    //     );
    //   },
    // );

// Consumer<ProductsProvider>(
//       builder: (context, value, child) {
//         if (value.isLoading) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }

//         final products = value.allProducts;
// @override
// Widget build(BuildContext context) {
//   return Consumer<ProductsProvider>(
//     builder: (context, value, child) {
//       if (value.isLoading) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       }

//       final products = value.allProducts;
//       return ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(products[index].title),
//             subtitle: Text(products[index].description),
//             // Add more fields as needed
//           );
//         },
//       );
//     },
//   );
// }
