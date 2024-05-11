import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class ImageController extends GetxController{
   RxString image_path=''.obs;
   Future getImage() async{
      final ImagePicker _picker=ImagePicker();
      final image=await _picker.pickImage(source: ImageSource.gallery);

      if(image!=null){
        image_path.value=image.path.toString();
      }
   }
}