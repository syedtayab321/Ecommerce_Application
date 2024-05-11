import 'package:ecommerceapp/Account_Data/User_own_data.dart';
import 'package:ecommerceapp/Authentications/StorageImages.dart';
import 'package:ecommerceapp/Main_directory/Bottom_tab_items/cart_related/cart.dart';
import 'package:ecommerceapp/widgets/list_widget.dart';
import 'package:ecommerceapp/widgets/logout.dart';
import'package:flutter/material.dart';
import 'package:get/get.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Setting",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon:Icon(Icons.arrow_back),
        ),
      ),
       body: SingleChildScrollView(
         scrollDirection: Axis.vertical,
           child: Container(
             width: Get.width,
             height: Get.height,
             child: Padding(
               padding: const EdgeInsets.all(9.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                      width: Get.width,
                      height: Get.height*0.18,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade600,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'assets/images/background_main.jpg',
                                  width:Get.width*0.35,
                                  height: Get.height*0.16,
                                  fit: BoxFit.cover,
                                ),
                            ),
                            Text(
                              "ABDULLAH SHAH",
                              style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                   ),
                   SizedBox(height: 10,),
                   Container(
                     width: Get.width,
                     height: Get.height*0.4,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         list_widget("Account","Click Here to Complete Account",Icon(Icons.account_circle_rounded),Colors.white,Colors.blue.shade800,page:user_own_data()),
                         list_widget("Cart","Click Here to View Cart Data",Icon(Icons.add_shopping_cart),Colors.white,Colors.orange.shade500,page:add_cart()),
                         list_widget("Privacy","Click Here to View Your Own Data",Icon(Icons.privacy_tip_outlined),Colors.white,Colors.teal.shade600,page:ImageScreen()),
                         list_widget("About","Click Here View About Details",Icon(Icons.align_vertical_bottom_outlined),Colors.white,Colors.blue.shade800,page:settings()),
                       ],
                     ),
                   ),
                   SizedBox(height: 10,),
                   logout_widget(),
                 ],
               ),
             ),
           ),
       ),
    );
  }
}
