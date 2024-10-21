// iPhoneSearchPage.dart
import 'package:flutter/material.dart';

class iPhoneSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search result for "iPhone"'),
      ),
      body: Center(
        child: Text('Menampilkan hasil untuk iPhone '),
      ),
    );
  }
}