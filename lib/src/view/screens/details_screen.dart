import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/core/photo_model.dart';
import '../../providers/photo_detail_provider.dart';
import '../widgets/photo_info_section.dart';
import '../widgets/comment_list.dart';
import '../widgets/comment_modal.dart';

class DetailScreen extends StatelessWidget {
  final Photo photo;
  final String? albumTitle;

  const DetailScreen({
    Key? key,
    required this.photo,
    this.albumTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PhotoDetailProvider(photo),
      child: Scaffold(
        appBar: AppBar(
          title: Text(photo.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
        body: Consumer<PhotoDetailProvider>(
          builder: (_, provider, __) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PhotoInfoSection(photo: photo, albumTitle: albumTitle),
                  const SizedBox(height: 24),
                  CommentList(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
