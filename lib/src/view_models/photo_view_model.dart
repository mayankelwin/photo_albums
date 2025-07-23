import 'package:photo_albums/src/models/local/photo_save.dart';
import 'package:signals/signals.dart';
import '../models/core/photo_model.dart';
import '../models/core/album_model.dart';
import '../models/api/api_services.dart';

class PhotoViewModel {
  final _service = ApiServices();
  final PhotoDao _photoDao = PhotoDao();

  final isLoading = signal(false);
  final photos = signal<List<Photo>>([]);
  final albums = signal<List<Album>>([]);
  final searchQuery = signal('');
  final selectedPhoto = signal<Photo?>(null);

 Future<void> loadPhotos() async {
  isLoading.value = true;
  try {
    final localPhotos = await _photoDao.getPhotos();

    if (localPhotos.isNotEmpty) {
      photos.value = localPhotos;
      print('Fotos carregadas do banco local: ${localPhotos.length}');
    }

    final apiPhotos = await _service.fetchPhotos();
    photos.value = apiPhotos;
    print('Fotos atualizadas da API: ${apiPhotos.length}');

    await _photoDao.insertPhotos(apiPhotos);
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
