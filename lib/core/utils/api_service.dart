import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await dio.get("https://api.quotable.io/$endpoint");

    return response.data;
  }
}
