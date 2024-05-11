import 'package:flutter/material.dart';
import 'package:get/get.dart';
class cloth_container extends StatelessWidget {
String imagepath;
String name;
String price;
Widget? page_path;
cloth_container(this.imagepath,this.name,this.price,this.page_path);
  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          bottomRight: Radius.circular(40)
      ),
      child: InkWell(
        onTap: (){
          Get.to(page_path);
        },
        child: Container(
          width: Get.width*0.7,
          height: Get.height*0.28,
          decoration: BoxDecoration(
            color: Colors.blue.shade400,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(imagepath),
                width: Get.width,
                height: 177,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(left:6.0,top:0.9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(name,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                    Text(price,style: TextStyle(color: Colors.white,fontSize: 17),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
