import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potter_book/features/base/view_model/base_view_model.dart';
import 'package:potter_book/widgets/navbar_view.dart';

class BaseView extends ConsumerWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(pageViewProvider);

    return Scaffold(
      body: PageView(
        controller: viewModel.controller,
        onPageChanged: viewModel.onPageChanged,
        children: viewModel.pages,
      ),
      bottomNavigationBar: const NavbarView(),
    );
  }
}
