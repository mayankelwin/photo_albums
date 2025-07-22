import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/core/photo_model.dart';
import '../../providers/photo_detail_provider.dart';
import 'comment_modal.dart';

class PhotoInfoSection extends StatelessWidget {
  final Photo photo;
  final String? albumTitle;

  const PhotoInfoSection({
    Key? key,
    required this.photo,
    required this.albumTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhotoDetailProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          photo.url,
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            height: 300,
            color: Colors.grey[300],
            child: const Center(child: Icon(Icons.broken_image, size: 80)),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(photo.title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                albumTitle ?? 'Álbum ID: ${photo.albumId}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 16),

              if (provider.user != null)
                Text(
                  'Autor: ${provider.user!.name}\nEmpresa: ${provider.user!.company.name}\nSlogan: "${provider.user!.company.catchPhrase}"',
                  style: TextStyle(color: Colors.grey[700]),
                ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.map),
                    label: const Text("Ver no mapa"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.email),
                    label: const Text("Enviar email"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => showCommentModal(context, photo.id),
                    icon: const Icon(Icons.comment),
                    label: const Text("Comentar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
