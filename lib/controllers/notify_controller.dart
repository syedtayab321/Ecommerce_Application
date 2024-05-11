import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class notify_controller extends GetxController{
  RxInt no_of_products=0.obs;

  User? user=FirebaseAuth.instance.currentUser;
  Future<void> fetchData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
          .collection('Data of User '+ user!.email.toString()).where('email',isEqualTo: user!.email)
          .get();
          no_of_products=querySnapshot.docs.length.obs;
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}