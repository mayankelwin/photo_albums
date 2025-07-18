import '../api/api_client.dart';
import '../core/photo_model.dart';

class PhotoService {
  final _client = ApiClient().dio;

  Future<List<Photo>> fetchPhotos() async {
    final response = await _client.get('/photos');
    return (response.data as List).map((json) => Photo.fromJson(json)).toList();
  }
}
