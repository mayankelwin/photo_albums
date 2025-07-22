import 'package:dio/dio.dart';
import '../core/photo_model.dart';
import '../core/album_model.dart';
import '../core/user_model.dart';
import '../core/comment_model.dart';

class ApiServices {
  final Dio dio = Dio(
    BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"),
  );

  // Photos (limit 50)
  Future<List<Photo>> fetchPhotos() async {
    try {
      print('[API] Buscando fotos...');
      final response = await dio.get(
        '/photos',
        queryParameters: {'_limit': 50},
      );

      final List data = response.data;
      return data.map((e) => Photo.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar fotos: $e');
    }
  }

  // Albums (limit 50)
  Future<List<Album>> fetchAlbums() async {
    try {
      final response = await dio.get(
        '/albums',
        queryParameters: {'_limit': 50},
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
      final response = await dio.get('/users');

      final List data = response.data;
      return data.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar usuários: $e');
    }
  }

  // Comments (limit 100)
  Future<List<Comment>> fetchComments() async {
    try {
      final response = await dio.get(
        '/comments',
        queryParameters: {'_limit': 100},
      );

      final List data = response.data;
      return data.map((e) => Comment.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar comentários: $e');
    }
  }
}
