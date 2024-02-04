import 'package:ecommerce_motion_flutter/carts_feature/presentation/providers/carts_provider.dart';
import 'package:ecommerce_motion_flutter/products_feature/data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBarTotal extends StatelessWidget {
  const BottomBarTotal({
    super.key,
    required this.product,
  });

  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF292526),
      ),
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Price',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            width: 200,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                context.read<CartProvider>().addToCart(product);
                print('on tap add');
                print('succes');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Barang berhasil di tambahkan'),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_checkout,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Add to cart',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
