import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../models/core/photo_model.dart';
import '../../providers/photo_detail_provider.dart';
import 'comment_modal.dart';
import 'package:shimmer/shimmer.dart';

Widget _imageSkeleton() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(
      color: Colors.white,
    ),
  );
}

class PhotoInfoSection extends StatefulWidget {
  final Photo photo;
  final String? albumTitle;

  const PhotoInfoSection({
    super.key,
    required this.photo,
    required this.albumTitle,
  });

  @override
  State<PhotoInfoSection> createState() => _PhotoInfoSectionState();
}

class _PhotoInfoSectionState extends State<PhotoInfoSection> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhotoDetailProvider>(context);
    final images = widget.photo.allImages ?? [widget.photo.url];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 400,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              final imgUrl = images[index];
              return CachedNetworkImage(
                imageUrl: imgUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.broken_image, size: 80)),
                ),
              );
            },
          ),
        ),

        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: images.length,
              effect: WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.photo.title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                widget.albumTitle ?? 'Álbum ID: ${widget.photo.albumId}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 16),

              if (provider.user != null)
                Text(
                  'Autor: ${provider.user!.name}\n'
                  'Empresa: ${provider.user!.company.name}\n'
                  'Slogan: "${provider.user!.company.catchPhrase}"',
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
                  ElevatedButton(
                    onPressed: () => showCommentModal(context, widget.photo.id),
                    child: const Icon(Icons.comment),
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
