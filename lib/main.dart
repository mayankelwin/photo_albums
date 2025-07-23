import 'package:flutter/material.dart';
import 'src/view/screens/home_screen.dart';
import 'src/view_models/photo_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PhotoViewModel viewModel = PhotoViewModel();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomeScreen(viewModel: viewModel),
    );
  }
}
