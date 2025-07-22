import 'package:dio/dio.dart';
import '../core/photo_model.dart';
import '../core/album_model.dart';
import '../core/user_model.dart';
import '../core/comment_model.dart';

class ApiServices {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  // Limits
  static const int photoLimit = 50;
  static const int albumLimit = 50;
  static const int commentLimit = 100;

  // Photos
  Future<List<Photo>> fetchPhotos() async {
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/photos',
        queryParameters: {'_limit': photoLimit},
      );

      final List data = response.data;
      return data.map((e) => Photo.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar fotos: $e');
    }
  }

// Albums
  Future<List<Album>> fetchAlbums() async {
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/albums',
        queryParameters: {'_limit': albumLimit},
      );

      final List data = response.data;
      return data.map((e) => Album.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar álbuns: $e');
    }
  }

  // Users
  Future<List<User>> fetchUsers() async {
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/users');

      final List data = response.data;
      return data.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar usuários: $e');
    }
  }

  // Comments
  Future<List<Comment>> fetchComments() async {
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/comments',
        queryParameters: {'_limit': commentLimit},
      );

      final List data = response.data;
      return data.map((e) => Comment.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar comentários: $e');
    }
  }
}
