import 'package:ecommerceapp/Main_directory/cloth_section/Mybottomsheet.dart';
import 'package:ecommerceapp/Main_directory/cloth_section/buy_now.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class single_product_container extends StatelessWidget {
  String image;
  String price;
  String name;
  single_product_container(this.image, this.name, this.price);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(image),
              radius: 70,
              backgroundColor: Colors.blue,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 24, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                  SizedBox(height: 5,),
                  Text("What is going to be happen", style: TextStyle(fontSize: 16,),),
                  Text(price, style: TextStyle(fontSize: 14, color: Colors.blueAccent)),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.bottomSheet(
                             bottom_sheet(image,name,price),
                             elevation: 10,
                             isDismissible: true,
                          );
                        },
                        child: Text("Add To Cart", style: TextStyle(color: Colors.white),),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueAccent.shade100),),),
                      SizedBox(width: 6,),
                      ElevatedButton(onPressed: () {
                        Get.to(buy_now(image, name, price));
                        },
                        child: Text("Buy Now"),),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
