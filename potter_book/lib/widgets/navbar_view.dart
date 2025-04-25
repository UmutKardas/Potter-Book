import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:potter_book/features/base/view_model/base_view_model.dart';

class NavbarView extends ConsumerWidget {
  const NavbarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(pageViewProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: _navBarStyle(context),
      child: _content(viewModel, context),
    );
  }

  GNav _content(PageViewModel viewModel, BuildContext context) {
    return GNav(
      selectedIndex: viewModel.currentIndex,
      onTabChange: viewModel.onTabChange,
      activeColor: Theme.of(context).primaryColor,
      color: Theme.of(context).colorScheme.surfaceTint,
      textStyle: Theme.of(
        context,
      ).textTheme.labelSmall?.copyWith(color: Theme.of(context).primaryColor),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      tabs: const [
        GButton(icon: Icons.home, text: 'Houses'),
        GButton(icon: Icons.search, text: 'Students'),
      ],
    );
  }

  BoxDecoration _navBarStyle(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.surface.withAlpha(40),
          blurRadius: 10,
          offset: const Offset(0, -2),
        ),
      ],
    );
  }
}
