import 'package:photo_albums/src/models/local/data_base_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../core/photo_model.dart';

class PhotoDao {
  final dbHelper = DatabaseHelper.instance;

  Future<void> insertPhotos(List<Photo> photos) async {
    final db = await dbHelper.database;

    Batch batch = db.batch();

    for (var photo in photos) {
      batch.insert(
        'photos',
        {
          'id': photo.id,
          'title': photo.title,
          'url': photo.url,
          'thumbnailUrl': photo.thumbnailUrl,
          'albumId': photo.albumId,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  Future<List<Photo>> getPhotos() async {
    final db = await dbHelper.database;

    final result = await db.query('photos');

    return result.map((json) => Photo.fromJson(json)).toList();
  }
}
