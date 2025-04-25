import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potter_book/constants/app_padding.dart';
import 'package:potter_book/controller/character_controller.dart';
import 'package:potter_book/extension/string_extension.dart';
import 'package:potter_book/model/character.dart';
import 'package:potter_book/widgets/character_segment_view.dart';
import 'package:potter_book/widgets/input_view.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsAsyncValue = ref.watch(studentsProvider);

    return Scaffold(
      appBar: _appBar(),
      body: _content(context, studentsAsyncValue),
    );
  }

  SafeArea _content(
    BuildContext context,
    AsyncValue<List<Character>> studentsAsyncValue,
  ) {
    return SafeArea(
      child: Padding(
        padding: AppPadding.scrollPagePadding,
        child: Column(
          children: [
            InputView(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Expanded(
              child: studentsAsyncValue.when(
                data: (students) {
                  return GridView.builder(
                    itemCount: students.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() => AppBar(title: const Text('Search'));

  String getHouse(Character student) {
    return student.house?.toString().split('.').last.capitalize() ?? 'Unknown';
  }
}
