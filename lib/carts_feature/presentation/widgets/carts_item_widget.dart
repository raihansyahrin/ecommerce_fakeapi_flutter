import 'package:ecommerce_motion_flutter/carts_feature/presentation/providers/carts_provider.dart';
import 'package:ecommerce_motion_flutter/products_feature/presentation/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final int? id;
  final String title;
  final String image;
  final double price;
  final int quantity;
  final String description;

  final String category;

  const CartItem(this.id, this.title, this.image, this.price, this.quantity,
      this.description, this.category,
      {super.key});

  // bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.white,
        // height: 180,
        // width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  width: 90,
                  height: 90,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Text(
                      title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    category,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$$price',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Container(
                        height: 38,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(strokeAlign: 1),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              color: Colors.white,
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .decrementQuantity(id!);
                              },
                              icon: context
                                          .watch<CartProvider>()
                                          .getQuantity(id!) ==
                                      1
                                  ? IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        // Jika quantity sudah 0, Anda bisa menentukan aksi tambahan atau melewatkan
                                        // Aksi tambahan atau melewatkan bisa diimplementasikan di sini
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: const Text(
                                                "Are you sure to delete?",
                                              ),
                                              actions: [
                                                TextButton(
                                                  child: const Text("Cancel"),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text("Ok"),
                                                  onPressed: () {
                                                    context
                                                        .read<CartProvider>()
                                                        .removeToCart(context
                                                            .read<
                                                                ProductsProvider>()
                                                            .findById(id!));
                                                    Navigator.of(context).pop();
                                                  },
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: const Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.remove,
                                        ),
                                      ),
                                    )
                                  : const Icon(Icons.remove),
                            ),
                            Text(
                              '${context.watch<CartProvider>().getQuantity(id!)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .incrementQuantity(id!);
                                print('on tap add');
                                print(context
                                    .read<CartProvider>()
                                    .getQuantity(id!));
                              },
                              icon: const Icon(
                                Icons.add,
                              ),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
