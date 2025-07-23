import 'package:flutter/material.dart';
import 'package:photo_albums/src/view/screens/details_screen.dart';
import 'package:photo_albums/src/view/widgets/photo_card_skeleton.dart';
import 'package:signals/signals_flutter.dart';
import '../../view_models/photo_view_model.dart';
import '../widgets/photo_card.dart';
import '../../models/core/album_model.dart';

class HomeScreen extends StatefulWidget {
  final PhotoViewModel viewModel;

  const HomeScreen({super.key, required this.viewModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    await Future.wait([
      widget.viewModel.loadPhotos(),
      widget.viewModel.loadAlbums(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Albums"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              autofocus: false,
              textInputAction: TextInputAction.search,
              onChanged: (value) => viewModel.searchQuery.value = value,
              decoration: InputDecoration(
                hintText: "Filter by photo, album or author",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          Expanded(
            child: Watch((context) {
              final isLoading = viewModel.isLoading.value;
              final photos = viewModel.photos.value;
              final searchQuery = viewModel.searchQuery.value;

              final filteredPhotos = photos.where((photo) {
                return photo.title.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                );
              }).toList();

              if (isLoading) {
                return ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) => const PhotoCardSkeleton(),
                );
              }


              if (filteredPhotos.isEmpty) {
                return const Center(child: Text("Nenhuma foto encontrada."));
              }

              return RefreshIndicator(
                onRefresh: _loadData,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  itemCount: filteredPhotos.length,
                  itemBuilder: (context, index) {
                    final photo = filteredPhotos[index];

                    Album? album;
                    try {
                      album = viewModel.albums.value.firstWhere(
                              (a) => a.id == photo.albumId);
                    } catch (_) {
                      album = null;
                    }

                    final albumTitle = album?.title;

                    return PhotoCard(
                      photo: photo,
                      productPrice: "R\$ ${(photo.id * 3.5).toStringAsFixed(2)}",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailScreen(
                              photo: photo,
                              albumTitle: albumTitle,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
