import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/controllers/CounterController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class bottom_sheet extends StatefulWidget {
  String image;
  String name;
  String price;
 bottom_sheet(this.image,this.name,this.price);

  @override
  State<bottom_sheet> createState() => _bottom_sheetState();
}

class _bottom_sheetState extends State<bottom_sheet> {
  counter_controller _counter_controller = Get.put(counter_controller());

  String userid= FirebaseAuth.instance.currentUser!.uid.toString();
  String user_email= FirebaseAuth.instance.currentUser!.email.toString();
  void adding_data() async{
      if(_counter_controller.counter>=1)
        {
          try{
            Map<String,dynamic> cart_data={
              "name":widget.name,
              "price":widget.price,
              "image":widget.image,
              "userid":userid,
              "no of product":_counter_controller.counter.toString(),
              "email":user_email,
            };

            await FirebaseFirestore.instance.collection("Data of User "+user_email).doc(widget.name).set(cart_data);
            Get.snackbar("sucess", "data added sucessfully to cart",colorText: Colors.white,backgroundColor: Colors.green);
          }
          catch(e){
            Get.snackbar("Error", e.toString(),colorText: Colors.white,backgroundColor: Colors.red);
          }
        }
      else
        {
          Get.snackbar("eroor", "PLease select one product at least",colorText: Colors.white,backgroundColor: Colors.red);
        }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height*0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:[
          Text(widget.name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30),),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.image,
               width: Get.width*0.8,
               height: Get.height*0.3,
               fit: BoxFit.cover,
            ),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Price of Product: ",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 16),),
                Text(widget.price,style: TextStyle(color: Colors.green,fontSize: 16),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Name of the Product: ",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 16),),
                Text(widget.name,style: TextStyle(color: Colors.green,fontSize: 16),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Total No of Products: ",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 16),),
                Container(
                  width: 110,
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: IconButton(
                          onPressed: (){_counter_controller.counter_decrease();},
                          icon:Icon(Icons.minimize),
                        ),
                      ),
                     Obx((){
                       return  Positioned(
                         top: 15,
                         left: 50,
                         child: Text(_counter_controller.counter.toString(),style: TextStyle(fontSize: 20),
                         ),
                       );
                     }),
                      Positioned(
                        top: 5,
                        right: 3,
                        child: IconButton(
                          onPressed: (){_counter_controller.counter_increase();},
                          icon:Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Container(
              width: Get.width*0.5,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(3,10)
                  ),
                ],
              ),
              child: TextButton(
                onPressed: (){
                  adding_data();
                },
                child: Text("Confirm",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,letterSpacing: 10,color: Colors.white),),
              ),
            ),
          ],
        ),
      ],
    ),
    );
  }
}
