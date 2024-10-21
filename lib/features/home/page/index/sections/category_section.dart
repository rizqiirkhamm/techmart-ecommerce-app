part of '../page.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  final List<Map<String, dynamic>> products; // Add this line

  const CategoryPage({
    Key? key,
    required this.categoryName,
    required this.products, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(categoryName),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return Container(
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
                      Center(
                        child: Image.asset(
                          product['image'],
                          width: 80,
                          height: 80,

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Text(
                          product['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xff393F42),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          '\$${product['price']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color(0xff007BFF),
                          ),
                        ),
                      ),
                    const  SizedBox(height: 6,),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
