import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ecommerceapp/controllers/BottoBarController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Main_screen extends StatelessWidget {
  BottombarController _controller =Get.put(BottombarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Obx((){
         return _controller.tabs[_controller.selectedindex.value];
       }),
      bottomNavigationBar:ConvexAppBar(
        height: 70,
        backgroundColor: Colors.blue.shade400,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.account_circle_rounded, title: 'Account'),
          TabItem(icon: Icons.shopping_cart, title: 'Cart'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: _controller.selectedindex.value, // Set the initial selected tab
        onTap: (int index) {
          _controller.increase(index);
        },
      ),
    );
  }
}


