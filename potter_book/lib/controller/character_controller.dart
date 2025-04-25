import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potter_book/model/character.dart';
import 'package:potter_book/service/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final studentsProvider = FutureProvider<List<Character>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.fetchStudents();
});

final characterProvider = Provider.family<AsyncValue<Character?>, String>((
  ref,
  id,
) {
  final AsyncValue<List<Character>> students = ref.watch(studentsProvider);
  return students.when(
    data:
        (data) =>
            AsyncValue.data(data.firstWhere((student) => student.id == id)),
    loading: () => const AsyncValue.loading(),
    error: (error, stackTrace) => AsyncValue.error(error, stackTrace),
  );
});

final houseStudentsProvider = FutureProvider.family<List<Character>, String>((
  ref,
  house,
) async {
  final students = await ref.watch(studentsProvider.future);
  return students
      .where(
        (student) => student.house?.name?.toLowerCase() == house.toLowerCase(),
      )
      .toList();
});
