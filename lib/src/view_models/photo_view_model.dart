import 'package:signals/signals.dart';
import '../models/core/photo_model.dart';
import '../models/core/album_model.dart';
import '../models/api/api_services.dart';

class PhotoViewModel {
  final _service = ApiServices();

  final photos = signal<List<Photo>>([]);
  final isLoading = signal(false);
  final searchQuery = signal('');
  final albums = signal<List<Album>>([]);

  Future<void> loadPhotos() async {
    isLoading.value = true;
    try {
      final result = await _service.fetchPhotos();
      photos.value = result;
    } catch (e) {
      print('Erro ao carregar fotos: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadAlbums() async {
    try {
      final result = await _service.fetchAlbums();
      albums.value = result;
    } catch (e) {
      print('Erro ao carregar álbuns: $e');
    }
  }
}
