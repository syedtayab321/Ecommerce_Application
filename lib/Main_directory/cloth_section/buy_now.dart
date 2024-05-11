import 'package:ecommerceapp/Main_directory/Main_screen_related/Main_screen.dart';
import 'package:ecommerceapp/controllers/CounterController.dart';
import 'package:ecommerceapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class buy_now extends StatefulWidget {
  String name;
  String price;
  String image;
  buy_now(this.image,this.name,this.price);

  @override
  State<buy_now> createState() => _buy_nowState();
}

class _buy_nowState extends State<buy_now> {
  favourite_controller _controller =Get.put(favourite_controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Image.network(
                  widget.image, // Replace with your hotel image asset
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top,
                  left: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black87),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                     Obx((){
                       return IconButton(
                         icon: _controller.isFavourite.value ?
                         Icon(Icons.favorite, color: Colors.red):
                         Icon(Icons.favorite_border, color: Colors.red),
                         onPressed: () {
                           _controller.change_icon();
                         },
                       );
                     }),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.price_change, color: Colors.green),
                          Text(
                            widget.price,
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                      // ... Other details like rating and open hours
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              width: Get.width,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Hotel President is a 5 star hotel...',
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Hotel President is a 5 star hotel...',
                  ),
                  SizedBox(height: 130,),
                  custom_button("CONFIRM", color:Colors.lightBlueAccent,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
