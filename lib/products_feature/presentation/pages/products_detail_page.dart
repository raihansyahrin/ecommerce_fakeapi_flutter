import 'package:ecommerce_motion_flutter/carts_feature/presentation/providers/carts_provider.dart';
import 'package:ecommerce_motion_flutter/products_feature/data/models/products_model.dart';
import 'package:ecommerce_motion_flutter/products_feature/presentation/provider/products_provider.dart';
import 'package:ecommerce_motion_flutter/products_feature/presentation/widgets/bottom_bar_total_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class ProductsDetailPage extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  const ProductsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments; // is the id!
    final product = context.watch<ProductsProvider>().findById(productId);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      product.image,
                      // fit: BoxFit.fitHeight,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2,

                      // color: const Color.fromARGB(41, 33, 149, 243),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF292526),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.chevron_left_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ClipRRect(
                child: Container(
                  // height: 300,
                  // height: MediaQuery.of(context).size.height / 2,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color(0xFF292526),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              product.title,
                              maxLines: 3,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          Container(
                            // decoration: const BoxDecoration(
                            //   color: Color.fromARGB(255, 250, 247, 240),
                            //   borderRadius:
                            //       BorderRadius.all(Radius.circular(12)),
                            // ),
                            child: Row(
                              children: [
                                IconButton(
                                  color: Colors.white,
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        side: const BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                IconButton(
                                  color: Colors.white,
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        side: const BorderSide(
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          30.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // const Divider(),
                      const SizedBox(
                        height: 10,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.category,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 214, 214, 214),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
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
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                  text: '${product.rating.rate}',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                      const Divider(),
                      // const SizedBox(
                      //   height: 10,
                      // ),

                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      ReadMoreText(
                        product.description,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        trimLines: 2,
                        colorClickableText: Colors.white,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: ' Show more',
                        trimExpandedText: ' Show less',
                        moreStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        lessStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBarTotal(product: product),
    );
  }
}

