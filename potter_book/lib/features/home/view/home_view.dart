import 'package:flutter/material.dart';
import 'package:potter_book/constants/app_padding.dart';
import 'package:potter_book/features/home/model/house_model.dart';
import 'package:potter_book/features/home/widgets/house_segment_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
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

  AppBar _appBar() => AppBar(title: const Text('Houses'));
}
