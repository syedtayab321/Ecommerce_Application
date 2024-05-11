import 'dart:ui';
import 'package:ecommerceapp/first_directory/login_related/login.dart';
import 'package:ecommerceapp/first_directory/singup_related/singup.dart';
import 'package:ecommerceapp/helpers/widget_helper.dart';
import 'package:ecommerceapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width, height: Get.height,
            child: Image.asset(
              'assets/images/background_main.jpg', width: Get.width,
              height: Get.height,
              fit: BoxFit.cover,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            // Adjust the blur values as needed
            child: Container(
              color: Colors
                  .transparent, // Use a transparent color to avoid affecting the image color
            ),
          ),
           welcome_container(),
        ],
      ),
    );
  }
}


class welcome_container extends StatelessWidget {
  const welcome_container({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white30,
      width: Get.width,
      height: Get.height*0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/splash.jpg'),
            radius: 60,
          ),
          SizedBox(height: 14,),
          text_helper("SYED CREATION",fontsize: 19,color: Colors.white,letterspacing: 10,),
          SizedBox(height: 15,),
          custom_button("Login",color:Colors.white,page:login()),
          SizedBox(height: 14,),
          custom_button("SINGUP",color:Colors.white,page:singup()),
          SizedBox(height: 29,),
          text_helper("Welcome to My Ecomerce Application",fontsize: 19,color: Colors.white),
        ],
      ),
    );
  }
}