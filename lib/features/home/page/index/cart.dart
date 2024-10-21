import 'package:ecommerce_techmart/features/home/page/checkout.dart';
import 'package:ecommerce_techmart/icons/receiptIcon.dart';
import 'package:ecommerce_techmart/icons/trashicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${demoCarts.length} items",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: demoCarts.length,
          itemBuilder: (context, index) {
            // Check if the index is valid
            if (index < demoCarts.length) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(demoCarts[index].product.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      demoCarts.removeAt(index);
                    });
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        SvgPicture.string(trashIcon),
                      ],
                    ),
                  ),
                  child: CartCard(cart: demoCarts[index]),
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
      bottomNavigationBar: const CheckoutCard(),
    );
  }
}

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {

    String productImage = (cart.product.images.isNotEmpty)
        ? cart.product.images[0]
        : 'https://via.placeholder.com/88';

    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(productImage),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                text: "\$${cart.product.price}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0xFF00BF6D)),
                children: [
                  TextSpan(
                      text: " x${cart.numOfItem}",
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.string(receiptIcon),
                ),
                const Spacer(),
                const Text("Add voucher code"),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Colors.black,
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      children: [
                        TextSpan(
                          text: "\$337.15",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  CheckoutScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFF00BF6D),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                    child: const Text("Check Out"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Cart {
  final Product product;
  final int numOfItem;

  Cart({required this.product, required this.numOfItem});
}

// Demo data for our cart
List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numOfItem: 1),
  Cart(product: demoProducts[1], numOfItem: 1),
  Cart(product: demoProducts[2], numOfItem: 1),
];

class Product {
  final int id;
  final String title;
  final List<String> images;
  final List<Color> colors;
  final double price;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    required this.title,
    required this.price,
  });
}

List<Product> demoProducts = [
  Product(
    id: 1,
    images: ["assets/images_recent/airpods.png"],
    colors: [
      const Color(0xFF00BF6D),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Airpods Pro",
    price: 499.99,
  ),
  // Add additional demo products here
  Product(
    id: 2,
    images: ["assets/images_recent/camera.png"],
    colors: [Colors.red],
    title: "Fujifilm Camera XA5",
    price: 500.22,
  ),
  Product(
    id: 3,
    images: ["assets/images_recent/macbook.png"],
    colors: [Colors.blue],
    title: "Macbook Pro - 8/128GB",
    price: 2010.99,
  ),
];
