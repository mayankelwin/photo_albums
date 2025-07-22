import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/core/comment_model.dart';
import '../../providers/photo_detail_provider.dart';

void showCommentModal(BuildContext context, int photoId) {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 20,
          left: 16,
          right: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Título", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: bodyController,
              maxLines: 4,
              decoration: const InputDecoration(labelText: 'Comentário'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                final comment = Comment(
                  postId: photoId,
                  id: DateTime.now().millisecondsSinceEpoch,
                  name: titleController.text,
                  email: 'fake@email.com',
                  body: bodyController.text,
                );
                Provider.of<PhotoDetailProvider>(context, listen: false).addComment(comment);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.send),
              label: const Text("Enviar"),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    },
  );
}
