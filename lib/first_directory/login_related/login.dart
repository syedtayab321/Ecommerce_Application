import 'dart:ui';

import 'package:ecommerceapp/Authentications/Login.dart';
import 'package:ecommerceapp/first_directory/login_related/forgot_password.dart';
import 'package:ecommerceapp/first_directory/password_field.dart';
import 'package:ecommerceapp/first_directory/text_field.dart';
import 'package:ecommerceapp/helpers/widget_helper.dart';
import 'package:ecommerceapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _email_controller=new TextEditingController();
  TextEditingController _password_controller=new TextEditingController();
  login_auth _login=new login_auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        child: Stack(
          children: [
            Image.asset('assets/images/login_singup_images/login_background.png',width: Get.width,height: Get.height,fit: BoxFit.cover,),
            Positioned(
              child: Container(
                width: Get.width,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back),color: Colors.white,),
                    TextButton(
                        onPressed: (){

                        },
                        child: text_helper("Create Account",color: Colors.white,fontsize: 18,letterspacing: 3,),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 200,
              left: 20,
              child: Container(
                width: Get.width*0.9,
                height: Get.height*0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    text_helper("LOGIN HERE",fontsize: 30,fontweight: FontWeight.w700,color: Colors.white,),
                    text_field(TextInputType.text, Colors.transparent, Text("Email"),Icon(Icons.email) , _email_controller),
                    password_field(TextInputType.text,Colors.transparent,Text("Password"),Icon(Icons.password),_password_controller),
                    custom_button("Login", color:Colors.blueAccent.shade100,text_color: Colors.white,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class forgot_password extends StatelessWidget {
  const forgot_password({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: (){
              Get.to(Forgotpassword());
            },
            child: text_helper("FORGOT PASSWORD!"),
          ),
        ],
      ),
    );
  }
}
