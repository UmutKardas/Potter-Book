import 'package:flutter/material.dart';
import 'package:potter_book/constants/app_padding.dart';
import 'package:potter_book/widgets/character_segment_view.dart';
import 'package:potter_book/widgets/input_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: SafeArea(
        child: Padding(
          padding: AppPadding.scrollPagePadding,
          child: Column(
            children: [
              InputView(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Expanded(
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return const CharacterSegmentView(); // Placeholder karakter view
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
