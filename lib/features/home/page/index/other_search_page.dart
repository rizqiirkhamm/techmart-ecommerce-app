import 'package:flutter/material.dart';

class OtherSearchPage extends StatelessWidget {
  final String query;

  OtherSearchPage({required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Search Results for "$query"'),
      ),
      body: const Center(
        child: Text(
          'There are no results for your search.',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
