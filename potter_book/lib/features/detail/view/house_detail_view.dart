import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:potter_book/constants/app_padding.dart';
import 'package:potter_book/controller/character_controller.dart';
import 'package:potter_book/extension/string_extension.dart';
import 'package:potter_book/model/character.dart';
import 'package:potter_book/widgets/character_segment_view.dart';

class HouseDetailView extends ConsumerWidget {
  const HouseDetailView({super.key, required this.detailTitle});

  final String detailTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final houseStudentsAsyncValue = ref.watch(
      houseStudentsProvider(detailTitle),
    );

    return Scaffold(
      appBar: _appBar(detailTitle.capitalize(), context),
      body: _content(context, houseStudentsAsyncValue),
    );
  }

  SafeArea _content(
    BuildContext context,
    AsyncValue<List<Character>> houseStudentsAsyncValue,
  ) {
    return SafeArea(
      child: Padding(
        padding: AppPadding.scrollPagePadding,
        child: Expanded(
          child: houseStudentsAsyncValue.when(
            data: (students) {
              return GridView.builder(
                itemCount: students.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final student = students[index];

                  return CharacterSegmentView(
                    imageUrl: student.image,
                    name: student.name,
                    house: getHouse(student),
                    id: student.id,
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
          ),
        ),
      ),
    );
  }

  AppBar _appBar(String title, BuildContext context) => AppBar(
    title: Text(title),
    leading: IconButton(
      onPressed: () {
        context.go('/');
      },
      icon: Icon(Icons.arrow_back_ios_new_rounded),
    ),
  );

  String getHouse(Character student) {
    return student.house?.toString().split('.').last.capitalize() ?? 'Unknown';
  }
}
