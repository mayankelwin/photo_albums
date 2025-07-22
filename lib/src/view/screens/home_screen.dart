import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import '../../view_models/photo_view_model.dart';
import '../widgets/photo_card.dart';

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
      widget.viewModel.loadPhotos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;

    return Scaffold(
      appBar: AppBar(title: const Text("Photo Albums"), centerTitle: true),
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
                suffixIcon: const Icon(Icons.search),
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
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: filteredPhotos.length,
                itemBuilder: (context, index) {
                  final photo = filteredPhotos[index];
                  final album = viewModel.albums.value.firstWhere(
                    (a) => a.id == photo.albumId,
                    orElse: () => null,
                  );
                  final albumTitle = album?.title;

                  return PhotoCard(photo: photo, albumTitle: albumTitle);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
