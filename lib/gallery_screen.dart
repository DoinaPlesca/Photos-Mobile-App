import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photos/photo_screen.dart';
import 'app_drawer.dart';

const imageDir = '/data/user/0/com.example.photos/cache/';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  _onPhotoTap(BuildContext context, File file) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PhotoScreen(file: file),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: Directory(imageDir).list().toList(),
        // the picture can be accessed as a file
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          final files = (snapshot.data ?? []).map((entry) => File(entry.path));
          return GridView.count(
            // maps filesystem entries to File objects.
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            children: [
              for (final file in files)
                GestureDetector(
                  onTap: () => _onPhotoTap(context, file),
                  child: Hero(
                    tag: file.path,
                    child: Image.file(file, fit: BoxFit.cover),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
