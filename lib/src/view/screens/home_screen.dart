import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_models/photo_view_model.dart';
import '../widgets/photo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<PhotoViewModel>(context, listen: false).loadPhotos();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PhotoViewModel>(context);
    final filteredPhotos = viewModel.photos.where((photo) {
      final query = _searchController.text.toLowerCase();
      return photo.title.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Photo Albums"), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Filter by photo, album or author",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {});
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: filteredPhotos.length,
                    itemBuilder: (context, index) {
                      final photo = filteredPhotos[index];
                      return PhotoCard(photo: photo);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
