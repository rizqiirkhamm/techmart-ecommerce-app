import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            const Text(
              'Details Product',
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 23),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(product['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              product['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () {
                              // Logika ketika ikon hati ditekan
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '\$ ${product['price']}',
                            style: const TextStyle(fontSize: 20, color: Colors.green),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            '( 219 people buy this )',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff393F42),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Choose The Color',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff939393),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildColorOption(const Color(0xFFF5E3DF), false),
                          _buildColorOption(Colors.white, true),
                          _buildColorOption(Colors.black, false),
                          _buildColorOption(const Color(0xFFE4F2DF), false),
                          _buildColorOption(const Color(0xFFD5E0ED), false),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color(0xff656B7B),
                            child: Icon(Icons.apple),
                          ),
                          const SizedBox(width: 12),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'AppleSphere',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Jawa Barat',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff939393),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 90),
                            child: Container(
                              width: 107,
                              height: 37,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  width: 1,
                                  color: const Color(0xffD9D9D9),
                                ),
                              ),
                              child: const Center(child: Text('Chat')),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Divider(),
                      const Text(
                        'Description of product',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 9),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquet arcu id tincidunt tellus arcu rhoncus, turpis nisl sed. Neque viverra ipsum orci, morbi semper. Nulla bibendum purus tempor semper purus. Ut curabitur platea sed blandit. Amet non at proin justo nulla et. A, blandit morbi suspendisse vel malesuada purus massa mi. Faucibus neque a mi hendrerit.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Logika untuk menambahkan ke keranjang
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffE5E5E5),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Logika untuk membeli sekarang
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorOption(Color color, bool isSelected) {
    return Container(
      width: 61,
      height: 41,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
        boxShadow: isSelected
            ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ]
            : null,
      ),
    );
  }
}
