import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potter_book/constants/app_padding.dart';
import 'package:potter_book/features/home/model/house_model.dart';
import 'package:potter_book/features/home/view_model/home_view_model.dart';
import 'package:potter_book/features/home/widgets/house_segment_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _appBar(ref, context),
      body: Padding(
        padding: AppPadding.pagePadding,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final itemSize = (constraints.maxWidth - 20) / 2;

            return SizedBox(
              width: double.infinity,
              height: constraints.maxHeight,
              child: Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children:
                      HouseModel().houses
                          .map(
                            (house) => SizedBox(
                              width: itemSize,
                              height: itemSize,
                              child: HouseSegmentView(house: house),
                            ),
                          )
                          .toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar _appBar(WidgetRef ref, BuildContext context) {
    return AppBar(
      title: const Text('Houses'),
      actions: [
        IconButton(
          icon: Icon(
            ref.read(homeViewModelProvider.notifier).currentTheme == 'dark'
                ? Icons.light_mode
                : Icons.dark_mode,
          ),
          color: Theme.of(context).colorScheme.onPrimary,
          tooltip: 'Toggle Theme',
          onPressed:
              () => ref.read(homeViewModelProvider.notifier).toggleTheme(),
        ),
      ],
    );
  }
}
