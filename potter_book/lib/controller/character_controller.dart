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
