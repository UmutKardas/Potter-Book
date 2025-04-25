import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search'), backgroundColor: Colors.blue),
      body: const Center(child: Text('Welcome to the Search Page!')),
    );
  }
}
