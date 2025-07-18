import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"),
  );
}
