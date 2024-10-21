import 'package:flutter/material.dart';
import 'product_search/iphone_search_page.dart';
import 'product_search/earphone_search_page.dart';
import 'other_search_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> searchHistory = [
    'Iphone',
    'Camera fujifilm',
    'Tripod Mini',
    'Bluetooth speaker',
    'Drawing pad'
  ];

  void removeFromHistory(String item) {
    setState(() {
      searchHistory.remove(item);
    });
  }

  void clearAllHistory() {
    setState(() {
      searchHistory.clear();
    });
  }

  void addToSearchHistory(String query) {
    setState(() {
      if (!searchHistory.contains(query)) {
        searchHistory.add(query);
      }
    });
  }

  void navigateToSearchResult(String query) {
    addToSearchHistory(query);
    if (query.toLowerCase().contains("iphone")) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => iPhoneSearchPage()),
      );
    } else if (query.toLowerCase().contains("earphone")) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EarphoneSearchPage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtherSearchPage(query: query)), // Halaman untuk produk lain
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: SizedBox(
                    width: 276,
                    height: 40,
                    child: TextField(
                      controller: _searchController,
                      onSubmitted: (value) {
                        navigateToSearchResult(value);
                      },
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
                    ),
                  ),
                ),
                IconButton(
                  icon: const Stack(
                    children: [
                      Icon(Icons.shopping_cart_outlined),
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.red,
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    // Implementasi tombol cart
                  },
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Last search',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: clearAllHistory,
                  child: const Text(
                    'Clear all',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            if (searchHistory.isNotEmpty)
              Expanded(
                child: ListView.separated(
                  itemCount: searchHistory.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 4), // Padding vertikal di ListTile
                      leading: const Icon(Icons.history, color: Colors.grey),
                      title: Text(searchHistory[index]),
                      onTap: () {
                        navigateToSearchResult(searchHistory[index]); // Navigasi saat item diketuk
                      },
                      trailing: SizedBox(
                        width: 40, // Menyediakan ruang untuk tombol close
                        child: IconButton(
                          padding: const EdgeInsets.all(0), // Menghapus padding default
                          icon: const Icon(Icons.close, color: Colors.grey),
                          onPressed: () {
                            removeFromHistory(searchHistory[index]);
                          },
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 1), // Jarak separator
                ),
              ),
            if (searchHistory.isEmpty)
              const Expanded(
                child: Center(
                  child: Text(
                    'No search history...',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
