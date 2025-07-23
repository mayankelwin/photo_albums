import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../models/core/photo_model.dart';
import 'photo_card_skeleton.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;
  final String? productPrice;
  final VoidCallback? onTap;

  const PhotoCard({
    super.key,
    required this.photo,
    this.productPrice,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        imageUrl: photo.thumbnailUrl,
        imageBuilder: (context, imageProvider) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image(
                      image: imageProvider,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          photo.title,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        if (productPrice != null)
                          Text(
                            'Valor: $productPrice',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Colors.grey[700],
                                ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '#${photo.id}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          );
        },
        placeholder: (context, url) => const PhotoCardSkeleton(),
        errorWidget: (context, url, error) => const PhotoCardSkeleton(),
      ),
    );
  }
}
