import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HouseDetailView extends StatelessWidget {
  const HouseDetailView({super.key, required this.detailTitle});

  final String detailTitle;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: _appBar(context),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [

          ],
        ),
      ),
    ),
  );

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(detailTitle, style: Theme.of(context).textTheme.titleLarge),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: () {
          context.go('/');
        },
      ),
    );
  }
}
