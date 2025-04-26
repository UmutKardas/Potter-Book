import 'package:dio/dio.dart';
import 'package:potter_book/constants/app_network_path.dart';
import 'package:potter_book/model/character.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Character>> fetchStudents() async {
    try {
      final response = await _dio.get(AppNetworkPath.students);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((item) => Character.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load students');
      }
    } catch (e) {
      throw Exception('Failed to load students: $e');
    }
  }
}
