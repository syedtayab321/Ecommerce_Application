import 'package:ecommerceapp/widgets/circlevatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class brand_container extends StatelessWidget {
  String imagepath;
  String name;
  String price;
  brand_container( this.imagepath,this.name,this.price);
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: Get.width*0.5,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue.shade400,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left:10.0,top:0.9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            circleavatar(imagepath,30,name,Colors.white),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name,style: TextStyle(color: Colors.white,fontSize: 20),),
                Text(price,style: TextStyle(color: Colors.brown.shade800,fontSize: 17),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
