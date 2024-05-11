import 'package:ecommerceapp/first_directory/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class list_widget extends StatelessWidget {
  String title;
  String subtitle;
  Widget icon;
  Color? iconColor;
  Color? backgroundColor;
  Widget? page;
  list_widget(this.title,this.subtitle,this.icon,this.iconColor,this.backgroundColor,{this.page});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(page);
      },
      child: ListTile(
        title: Text(title,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
        subtitle: Text(subtitle,style: TextStyle(fontSize: 15),),
        trailing: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_forward_ios),
        ),
        leading: Container(
           width: 50,
           height: 50,
           decoration: BoxDecoration(
             color: backgroundColor,
             borderRadius: BorderRadius.circular(40),
           ),
          child: IconButton(
            onPressed: (){
            },
            icon:icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
