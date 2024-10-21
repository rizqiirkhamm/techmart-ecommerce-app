import 'package:ecommerce_techmart/features/home/page/index/cart.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ecommerce_techmart/icons/filters.dart';
import 'detail_screen.dart';
import 'search_page.dart';

part 'sections/category_section.dart';

class HomePage extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/banner-1.png',
    'assets/images/banner-2.png',
    'assets/images/banner-3.png',
  ];

  final List<Map<String, String>> categories = [
    {'image': 'assets/images_category/apparel.png', 'label': 'Apparel'},
    {'image': 'assets/images_category/school.png', 'label': 'School'},
    {'image': 'assets/images_category/sports.png', 'label': 'Sports'},
    {'image': 'assets/images_category/electronic.png', 'label': 'Electronic'},
    {'image': 'assets/images_category/all.png', 'label': 'All'},
  ];

  final Map<String, List<Map<String, dynamic>>> categoryProducts = {
    'Apparel': [
      {
        'name': 'Cozy Pink Hoodie',
        'price': '25.00',
        'image': 'assets/images_apparel/hoodie.png',
      },
      {
        'name': 'Classic Black Leather Jacket',
        'price': '55.00',
        'image': 'assets/images_apparel/jacket.png',
      },
    ],
    'School': [
      {
        'name': 'jokyo',
        'price': '5.00',
        'image': 'assets/images_recent/jokyo.jpg',
      },
      {
        'name': 'set rautan anak anaka',
        'price': '15.00',
        'image': 'assets/images_recent/set-rautan.jpg',
      },
    ],
    'Sports': [
      {
        'name': 'Basketball',
        'price': '2.00',
        'image': 'assets',
    }
    ],
  };

  final List<Map<String, dynamic>> recentProducts = [
    {
      'name': 'Monitor LG 22”inc 4K 120Fps',
      'price': '199.99',
      'image': 'assets/images_recent/monitor.png',
    },
    {
      'name': 'Aestechic Mug - white variant',
      'price': '19.99',
      'image': 'assets/images_recent/mug.png',
    },
    {
      'name': 'Airpods Pro',
      'price': '499.99',
      'image': 'assets/images_recent/airpods.png',
    },
    {
      'name': 'Playstation 4 - SSD 128GB',
      'price': '1999.99',
      'image': 'assets/images_recent/ps4.png',
    },
    {
      'name': 'Black T-shirt',
      'price': '199.99',
      'image': 'assets/images_recent/shirt.png',
    },
    {
      'name': 'Macbook Pro - 8/128GB - With touchbar',
      'price': '2010.99',
      'image': 'assets/images_recent/macbook.png',
    },
    {
      'name': 'Fujifilm Camera XA5',
      'price': '500.22',
      'image': 'assets/images_recent/camera.png',
    },
    {
      'name': 'Cream Hoodie for Boy',
      'price': '20.00',
      'image': 'assets/images_recent/hoodie.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Delivery address and notification/shop icons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery address',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Color(0xffC8C8CB),
                          ),
                        ),
                        Text(
                          'Salatiga City, Central Java',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xff393F42),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartScreen(),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.shopping_cart,
                            size: 25,
                          ),
                        ),
                        const SizedBox(width: 13),
                        const Icon(
                          Icons.notifications,
                          size: 28,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Search bar
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color(0xffF0F2F1),
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 20,
                        color: Color(0xff939393),
                      ),
                      hintText: 'Search here...',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color(0xffC8C8CB),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              const SearchPage(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(
                                0.0, 1.0);
                            const end = Offset.zero;
                            const curve = Curves.easeInOut;
                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // Carousel Slider
                CarouselSlider.builder(
                  itemCount: imagePaths.length,
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return SizedBox(
                      height: 144,
                      width: 304,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          imagePaths[index],
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: 144,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    viewportFraction: 0.8,
                  ),
                ),
                const SizedBox(height: 16),
                // Categories section
                const Text(
                  'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff393F42),
                  ),
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: categories.map((category) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryPage(
                              categoryName: category['label']!,
                              products: categoryProducts[category['label']]!,
                            ),
                          ),
                        );
                      },
                      child: _buildCategoryIcon(
                        category['image']!,
                        category['label']!,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                // Recent Products section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Product',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xff393F42),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xffF0F2F1),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 6),
                        child: Row(
                          children: [
                            const Text('Filters'),
                            const SizedBox(width: 15),
                            SvgPicture.string(filtersLogo),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: recentProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = recentProducts[index];
                    return GestureDetector(
                      // Menggunakan GestureDetector
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailScreen(product: product),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffFAFAFC),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 7,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(product['image']),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 13, right: 13, left: 13),
                              child: Text(
                                product['name'],
                                style: const TextStyle(
                                  color: Color(0xff393F42),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 13, left: 13, bottom: 11),
                              child: Text(
                                '\$${product['price']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                width: 144,
                                height: 31,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: const Color(0xff67C4A7),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Add To Cart',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(String imagePath, String label) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffF0F2F1),
          ),
          child: ClipOval(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xff393F42),
          ),
        ),
      ],
    );
  }
}
