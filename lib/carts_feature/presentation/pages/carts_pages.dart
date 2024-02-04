import 'package:ecommerce_motion_flutter/carts_feature/presentation/providers/carts_provider.dart';
import 'package:ecommerce_motion_flutter/carts_feature/presentation/widgets/carts_item_widget.dart';
import 'package:ecommerce_motion_flutter/checkout_feature/presentation/checkout_page.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CartsPage extends StatelessWidget {
  const CartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProduct = context.watch<CartProvider>();
    final getCartProduct = cartProduct.shopCart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carts'),
      ),
      body: ListView.separated(
        itemCount: getCartProduct.length,
        itemBuilder: (context, i) {
          return CartItem(
            getCartProduct[i].id,
            getCartProduct[i].title,
            getCartProduct[i].image,
            getCartProduct[i].price,
            getCartProduct[i].quantity,
            getCartProduct[i].description,
            getCartProduct[i].category,
          );
        },
        separatorBuilder: (context, index) => const Divider(
          indent: 20,
          endIndent: 20,
        ),
      ),
      // bottomNavigationBar: BottomBarTotal(product: product),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: const Color.fromARGB(255, 114, 114, 114),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  '\$${cartProduct.getTotalPrice()}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutPage(),
                    ));
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(50),
                  ),
                ),
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
