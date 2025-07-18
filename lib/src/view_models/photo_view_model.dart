import 'package:flutter/material.dart';
import '../models/services/photo_service.dart';
import '../models/core/photo_model.dart';

class PhotoViewModel extends ChangeNotifier {
  final _service = PhotoService();
  List<Photo> photos = [];
  bool isLoading = false;

  Future<void> loadPhotos() async {
    isLoading = true;
    notifyListeners();

    try {
      photos = await _service.fetchPhotos();
    } catch (e) {
      print('Erro ao carregar fotos: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
