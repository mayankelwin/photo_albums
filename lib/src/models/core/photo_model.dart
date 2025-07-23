class Photo {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
  final int albumId;
  final List<String>? allImages;

  Photo({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
    required this.albumId,
    this.allImages,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
      albumId: json['albumId'],
    );
  }

  factory Photo.fromDummyJson({
    required int id,
    required String title,
    required String url,
    required String thumbnailUrl,
    required int albumId,
  }) {
    return Photo(
      id: id,
      title: title,
      url: url,
      thumbnailUrl: thumbnailUrl,
      albumId: albumId,
    );
  }
}
