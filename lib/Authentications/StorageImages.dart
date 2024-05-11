import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageScreen extends StatefulWidget {
  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  List<String> imageUrls = [];
  @override
  void initState() {
    super.initState();
    fetchImages();
  }
  Future<void> fetchImages() async {
    try {
      Reference imagesRef = _storage.ref().child('ShirtImages');
      ListResult result = await imagesRef.listAll();
      for (Reference ref in result.items) {
        String url = await ref.getDownloadURL();
        setState(() {
          imageUrls.add(url);
        });
      }
    } catch (e) {
      print("Error fetching images: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Image Retrieval'),
      ),
      body: ListView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              imageUrls[index],
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
