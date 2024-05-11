import 'package:flutter/material.dart';
import 'package:get/get.dart';

class counter_controller extends GetxController {
       RxInt counter=1.obs;

      void  counter_increase(){
        counter++;
      }
       counter_decrease(){
        counter--;
       }
}

class favourite_controller extends GetxController {
  RxBool isFavourite=false.obs;

  change_icon(){
    isFavourite.value=!isFavourite.value;
  }

}