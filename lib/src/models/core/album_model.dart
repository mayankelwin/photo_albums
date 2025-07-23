import 'photo_model.dart';

class Album {
  final int id;
  final String title;
  final List<Photo> photos; 

  Album({
    required this.id,
    required this.title,
    required this.photos,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
      photos: [],
    );
  }

  factory Album.fromDummyJson(Map<String, dynamic> json) {
    final images = (json['images'] as List).cast<String>();
    return Album(
      id: json['id'],
      title: json['title'],
      photos: images
          .map((url) => Photo(
                id: json['id'],
                albumId: json['id'],
                title: json['title'],
                url: url,
                thumbnailUrl: url,
              ))
          .toList(),
    );
  }
}
