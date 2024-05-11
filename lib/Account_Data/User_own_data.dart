import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/controllers/ImageController.dart';
import 'package:ecommerceapp/helpers/widget_helper.dart';
import 'package:ecommerceapp/widgets/data_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class user_own_data extends StatelessWidget {

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Data of User "+user!.email.toString()).where('User id',isEqualTo: user!.uid).snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Container(
              width: Get.width,
              decoration: BoxDecoration(
              ),
              child:ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount:snapshot.data!.docs.length,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        Container(
                          width: Get.width,
                          height: Get.height * 0.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                CircleAvatar(
                                  backgroundImage:NetworkImage(snapshot.data!.docs[index]['Profile Picture']),
                                  radius: 80,
                                ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Add Profile Picture",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: Get.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               data_cotainer("User Name", snapshot.data!.docs[index]['Username']),
                               data_cotainer("Full Name", snapshot.data!.docs[index]['Fullname']),
                               data_cotainer("Gender", snapshot.data!.docs[index]['Gender']),
                               data_cotainer("Age", snapshot.data!.docs[index]['Age']),
                               data_cotainer("Mobile No", snapshot.data!.docs[index]['Mobile No']),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
              ),
            );
          }
          else
          {
            return Container(
              child: Center(
                child:text_helper("No data found",fontsize:20,color:Colors.white,),
              ),
            );
          }
        },
      ),
    );
  }
}


