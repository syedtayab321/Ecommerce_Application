import 'package:ecommerceapp/first_directory/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class logout_widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.defaultDialog(
          title: "Confirmation",
          content: Text("Are you sure you want to Logout"),
          confirm: ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Get.offAll(
                    () => welcome(), // Use the correct destination page
              );
            },
            child: Text("Confirm"),
          ),
          cancel:  ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Cancel"),
          ),
        );
      },
      child: ListTile(
        title: Text( "Logout",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
        subtitle: Text("Click to Logout",style: TextStyle(fontSize: 15),),
        trailing: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_forward_ios),
        ),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.red.shade600,
            borderRadius: BorderRadius.circular(40),
          ),
          child: IconButton(
            onPressed: (){
            },
            icon:Icon(Icons.logout),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
