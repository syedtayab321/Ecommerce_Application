import 'package:ecommerceapp/first_directory/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class First_page extends StatefulWidget {
  const First_page({super.key});

  @override
  State<First_page> createState() => _First_pageState();
}

class _First_pageState extends State<First_page> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
     Get.off(
         welcome(),
       transition: Transition.fade,
       duration: Duration(milliseconds: 500),
     );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Container(
           width: Get.width,
           height: Get.height,
           child: Stack(
             children: [
               Image.asset('assets/images/splash.jpg',
                 fit: BoxFit.cover,
                 width: Get.width,
                 height: Get.height,
               ),
               Center(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     CircleAvatar(
                       backgroundImage: AssetImage('assets/images/logo1.jpeg'),
                       radius: 60,
                     ),
                     Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Text(
                         "Welcome to My E-Commerce Application, Here You will Find All the data ",
                         style: GoogleFonts.alegreya(
                           fontSize: 30,
                           color: Colors.white,
                         ),
                       ),
                     ),
                     CircularProgressIndicator(
                       color: Colors.white,
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
    );
  }
}
