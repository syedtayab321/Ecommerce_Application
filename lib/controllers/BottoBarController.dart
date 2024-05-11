import 'package:ecommerceapp/Account_Data/User_own_data.dart';
import 'package:ecommerceapp/Main_directory/Bottom_tab_items/Home_related/home.dart';
import 'package:ecommerceapp/Main_directory/Bottom_tab_items/cart_related/cart.dart';
import 'package:ecommerceapp/Main_directory/Bottom_tab_items/message_related/message.dart';
import 'package:ecommerceapp/Main_directory/Bottom_tab_items/setting_related/setting.dart';
import 'package:get/get.dart';

class BottombarController extends GetxController{
  Rx<int> selectedindex=0.obs;

  List tabs=[
    header_part(),
    user_own_data(),
    add_cart(),
    message(),
    settings(),
  ];

  increase(int value){
    selectedindex.value=value;
  }
}