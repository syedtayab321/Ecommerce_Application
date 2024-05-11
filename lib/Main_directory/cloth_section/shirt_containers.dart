import 'package:ecommerceapp/Main_directory/cloth_section/single_product_container.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class shirt_containers extends StatefulWidget {

  @override
  State<shirt_containers> createState() => _shirt_containersState();
}

class _shirt_containersState extends State<shirt_containers> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  List<String> imageUrls = [];
  @override
  void initState() {
    super.initState();
    fetchImages();
  }
  Future<void> fetchImages() async {
    try {
      Reference imagesRef = _storage.ref().child('ProductImages');
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
    print(imageUrls.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back,color: Colors.white,),
        ),
      ),
       body: Container(
              width: Get.width,
            color: Colors.black87,
         child: ListView.builder(
             itemCount: imageUrls.length,
             itemBuilder: (context,index){
               return single_product_container(imageUrls[index],"njsxjds","jgdcbdgh");
             }
         ),
       ),
    );
  }
}
