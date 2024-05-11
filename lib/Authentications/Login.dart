import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Main_directory/Main_screen_related/Main_screen.dart';

class login_auth{
  Future<void> login_form(String email,String password) async {
    try{
      UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(userCredential!=null){
        Get.snackbar('Sucess', "Login SucessfUll",snackPosition:SnackPosition.TOP,colorText: Colors.black87,backgroundColor: Colors.greenAccent );
        Get.offAll(
              () => Main_screen(),
        );
      }
      else
      {
        Get.snackbar('Error', "Wrong Cridentials",snackPosition:SnackPosition.BOTTOM,colorText: Colors.white,backgroundColor: Colors.red );
      }
    }
    on FirebaseAuthException catch(e){
      Get.snackbar('ERORR OCCUREED', e.toString(),snackPosition:SnackPosition.BOTTOM,colorText: Colors.white,backgroundColor: Colors.red);
    }
  }
}