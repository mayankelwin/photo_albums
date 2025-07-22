import 'package:flutter/material.dart';
import '../models/core/comment_model.dart';
import '../models/core/photo_model.dart';
import '../models/core/user_model.dart';
import '../models/api/api_services.dart';

class PhotoDetailProvider with ChangeNotifier {
  final ApiServices _api = ApiServices();
  final Photo photo;

  User? user;
  List<Comment> comments = [];
  bool isLoading = true;

  PhotoDetailProvider(this.photo) {
    loadDetails();
  }

  Future<void> loadDetails() async {
    try {
      final users = await _api.fetchUsers();
      final allComments = await _api.fetchComments();

      user = users.firstWhere(
            (u) => u.id == photo.albumId,
        orElse: () => users.first,
      );

      comments = allComments.where((c) => c.postId == photo.id).toList();
    } catch (e) {
      print("Erro ao carregar dados: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void addComment(Comment comment) {
    comments.insert(0, comment);
    notifyListeners();
  }
}
