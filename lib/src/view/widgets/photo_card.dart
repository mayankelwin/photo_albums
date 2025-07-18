import 'package:flutter/material.dart';
import '../../models/core/photo_model.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;

  const PhotoCard({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Image.network(
          photo.thumbnailUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(photo.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text('Photo ID: ${photo.id}'),
        onTap: () {
          // Aqui vai navegar para a detail screen
        },
      ),
    );
  }
}
