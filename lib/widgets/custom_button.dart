import 'package:ecommerceapp/helpers/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class custom_button extends StatelessWidget {

  String name;
  Color? color;
  Widget? page;
  Color? text_color;
  custom_button(this.name,{this.color,this.page,this.text_color});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       Get.to(page);
      },
      child: Container(
        width: Get.width*0.95,
        height: 55,
        child: Center(child: text_helper(name,color: text_color,letterspacing: 8,),),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
      ),
    );
  }
}
