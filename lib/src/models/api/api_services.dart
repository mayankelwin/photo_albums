import 'package:dio/dio.dart';
import '../core/photo_model.dart';
import '../core/album_model.dart';
import '../core/user_model.dart';
import '../core/comment_model.dart';

class ApiServices {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://dummyjson.com",
    ),
  );

  // Limits
  static const int albumLimit = 50;
  static const int userLimit = 30;     

  // Albums
    Future<List<Album>> fetchAlbums() async {
      try {
        final response = await dio.get(
          '/products',
          queryParameters: {'limit': albumLimit},
        );

        final List data = response.data['products'];

        return data.map((product) {
          final images = (product['images'] as List).cast<String>();

          return Album(
            id: product['id'],
            title: product['title'],
            photos: images
                .map((imageUrl) => Photo(
                      id: product['id'],
                      albumId: product['id'],
                      title: product['title'],
                      url: imageUrl,
                      thumbnailUrl: imageUrl,
                    ))
                .toList(),
              );
              }).toList();
              } catch (e) {
                throw Exception('Erro ao buscar álbuns: $e');
            }
          }

  // Photos
    Future<List<Photo>> fetchPhotos() async {
      try {
        final response = await dio.get(
          '/products',
          queryParameters: {'limit': albumLimit},
        );

        final List data = response.data['products'];

        final photos = <Photo>[];

        for (var product in data) {
          final images = (product['images'] as List).cast<String>();
          final productId = product['id'] as int;
          final productTitle = product['title'] as String;

          if (images.isNotEmpty) {
            photos.add(
              Photo(
                id: productId,
                albumId: productId,
                title: productTitle,
                url: images[0],
                thumbnailUrl: images[0],
                allImages: images,
              ),
            );
          }
        }

        return photos;
      } catch (e) {
        throw Exception('Erro ao buscar fotos: $e');
      }
    }


  // Users (autores)
  Future<List<User>> fetchUsers() async {
    try {
      final response = await dio.get(
        '/users',
        queryParameters: {'limit': userLimit},
      );

      final List data = response.data['users'];
      return data.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar usuários: $e');
    }
  }

  // Comments
  Future<List<Comment>> fetchComments() async {
    try {
      final response = await dio.get(
        '/comments',
      );

      final List data = response.data['comments'];
      return data.map((e) => Comment.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar comentários: $e');
    }
  }
}
