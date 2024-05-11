import 'package:ecommerceapp/first_directory/singup_related/complete_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Singup{
  Future<void> sing_up(String email,String password) async {
    try{
      UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(userCredential!=null){
        Get.snackbar('Errror', "Please Fill All the fields",snackPosition:SnackPosition.TOP,colorText: Colors.greenAccent );
        Get.off(
          complete_data(),
        );
      }
    }
    on FirebaseAuthException catch(e){
      Get.snackbar('Error', e.toString(),snackPosition:SnackPosition.TOP,colorText: Colors.white,backgroundColor: Colors.red );
    }
  }
}