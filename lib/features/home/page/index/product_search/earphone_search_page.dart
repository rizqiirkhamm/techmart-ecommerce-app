import 'package:ecommerce_techmart/icons/filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Pastikan ini ditambahkan ke pubspec.yaml untuk menggunakan SvgPicture

class EarphoneSearchPage extends StatelessWidget {

  final List<Map<String, String>> earphoneProducts = [
    {
      'name': 'Apple AirPods Max - Premium Over-Ear Headphones',
      'image': 'assets/images_earphone/earphone_apple.png',
      'price': '249',
    },
    {
      'name': 'AirPods Gen 1 - Wireless Earbuds with Charging Case',
      'image': 'assets/images_earphone/earphone_airpods_gen1.png',
      'price': '159',
    },
    {
      'name': 'AirPods Pro - Advanced Noise-Cancelling Earbuds',
      'image': 'assets/images_earphone/earphone_airpods_gen2.png',
      'price': '549',
    },
    {
      'name': 'Apple Wired EarPods with 3.5mm Connector',
      'image': 'assets/images_earphone/earphone_cable.png',
      'price': '179',
    },
    {
      'name': 'Beats Solo Pro - Wireless Noise-Cancelling Headphones',
      'image': 'assets/images_earphone/earphone_bubble.png',
      'price': '90',
    },
    {
      'name': 'Beats NewEra Pro - Wireless Limited Edition',
      'image': 'assets/images_earphone/earphone_new_era.png',
      'price': '450',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Search result for "Earphone"'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Search results for "Earphone"',
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
                          SvgPicture.string(
                           filtersLogo,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.75,
                ),
                itemCount: earphoneProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = earphoneProducts[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFAFAFC),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 7,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(product['image']!),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 13, right: 13, left: 13),
                          child: Text(
                            product['name']!,
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
                          padding: const EdgeInsets.only(left: 13, bottom: 11),
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
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
