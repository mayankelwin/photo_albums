import 'package:flutter/material.dart';
import '../models/core/photo_model.dart';
import '../models/api/api_services.dart';

class PhotoViewModel extends ChangeNotifier {
  final _service = ApiServices();

  List<Photo> photos = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadPhotos() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      photos = await _service.fetchPhotos();
    } catch (e) {
      errorMessage = 'Erro ao carregar fotos: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
