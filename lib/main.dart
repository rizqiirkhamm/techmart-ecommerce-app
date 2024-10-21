import 'package:ecommerce_techmart/features/account/page.dart';
import 'package:ecommerce_techmart/features/history/page.dart';
import 'package:ecommerce_techmart/features/home/page/index/page.dart';
import 'package:ecommerce_techmart/features/wishlist/page.dart';
import 'package:ecommerce_techmart/splash_screen.dart';
import 'package:flutter/material.dart';

import 'icons/icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

List<Widget> pages =  [
HomePage(),
WishlistPage(),
HistoryPage(),
AccountPage(),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        onTap: (int index) {
          setState(() {
            selectIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xff67C4A7),
        type: BottomNavigationBarType.fixed,
        // kalau ingin lebih dari 3 icon
        items: const [
          BottomNavigationBarItem(
            icon: Icon(PageIcon.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
