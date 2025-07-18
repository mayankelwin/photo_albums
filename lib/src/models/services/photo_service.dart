import '../api/api_services.dart';
import '../core/photo_model.dart';

class PhotoService {
  final _client = ApiServices().dio;

  Future<List<Photo>> fetchPhotos() async {
    final response = await _client.get('/photos');
    return (response.data as List).map((json) => Photo.fromJson(json)).toList();
  }
}
