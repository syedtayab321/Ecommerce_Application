import 'package:flutter/material.dart';
import 'package:get/get.dart';

class data_cotainer extends StatelessWidget {
  String heading;
  String value;
 data_cotainer(this.heading,this.value);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.orange.shade300,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(heading,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
              Text(value,style: TextStyle(fontSize: 21),),
            ],
          )
      ),
    );
  }
}
