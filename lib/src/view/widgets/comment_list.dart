import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/photo_detail_provider.dart';

class CommentList extends StatelessWidget {
  const CommentList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhotoDetailProvider>(context);

    print('Comentários carregados: ${provider.comments.length}');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Comentários", style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          if (provider.comments.isEmpty)
            Text('Nenhum comentário disponível'),
          ...provider.comments.map((comment) => Card(
            child: ListTile(
              title: Text(comment.name),
              subtitle: Text(comment.body),
              trailing: Text(comment.email),
            ),
          )),
        ],
      ),
    );
  }
}
