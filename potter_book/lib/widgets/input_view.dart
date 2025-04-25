import 'package:flutter/material.dart';

class InputView extends StatelessWidget {
  const InputView({super.key});

  @override
  Widget build(BuildContext context) => TextField(
    cursorColor: Theme.of(context).primaryColor,
    decoration: InputDecoration(
      hintText: 'Search for characters',
      prefixIcon: const Icon(Icons.search),
    ),
  );
}
