import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../Main_directory/Main_screen_related/Main_screen.dart';
import 'dart:io';
class User_Data{
  Future<void> add_user_data(String fullname,String username,String gender,String age,String number,File ProfileImage) async{
    var userid= await FirebaseAuth.instance.currentUser!.uid.toString();
    var email= await FirebaseAuth.instance.currentUser!.email.toString();

    if(username!=null  && fullname!=null && age!=null && ProfileImage!=null && gender!=null && number!=null)
      {
        UploadTask uploadTask=FirebaseStorage.instance.ref().child("ProfilePictures").child(userid).putFile(ProfileImage);
        TaskSnapshot taskSnapshot= await uploadTask;
        uploadTask.snapshotEvents.listen((snapshot) {
          double percentage =snapshot.bytesTransferred/snapshot.totalBytes*100;
        });
        String imageurl=await taskSnapshot.ref.getDownloadURL();

        Map<String,dynamic> data={
          'Fullname':fullname,
          'User id':userid,
          'Username':username,
          'Gender':gender,
          'Age':age,
          'Mobile No':number,
          'Profile Picture':imageurl,
        };
        try{
          await FirebaseFirestore.instance.collection("Data of User "+ email).doc("User Personal data").set(data);
          Get.snackbar("Sucesss", "Data added sucessfully",backgroundColor: Colors.green.shade600,colorText: Colors.white,);
          Get.offAll(Main_screen());
        }
        on FirebaseAuthException catch(e){
          Get.snackbar("error", e.toString(),backgroundColor: Colors.red,colorText: Colors.white);
        }
      } //if statement end
    else{
      Get.snackbar("error","Please fill all the fields",backgroundColor: Colors.red,colorText: Colors.white);
    }
  }//function close here
}