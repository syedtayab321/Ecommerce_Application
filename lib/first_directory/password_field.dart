import 'package:ecommerceapp/controllers/Password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class password_field extends StatefulWidget {
  TextInputType? type;
  Color? fillcolor;
  Text? label;
  Icon? prefixicon;
  TextEditingController controller;
  password_field(this.type,this.fillcolor,this.label,this.prefixicon,this.controller);
  @override
  State<password_field> createState() => _password_fieldState();
}

class _password_fieldState extends State<password_field> {
  final Password_controller _controller1=Get.put(Password_controller());
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return TextFormField(
        keyboardType: widget.type,
        obscureText:_controller1.show.value,
        controller:widget.controller,
        obscuringCharacter: "*",
        decoration: InputDecoration(
            fillColor: widget.fillcolor,
            filled: true,
            label: widget.label,
            labelStyle: TextStyle(color: Colors.white),
            suffixIcon: IconButton(
              onPressed: (){
                _controller1.show_password();
              },
              icon:_controller1.show.value?Icon(Icons.remove_red_eye_outlined):Icon(Icons.remove_red_eye_rounded),
            ),
            suffixIconColor: Colors.white,
            prefixIcon: widget.prefixicon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white), // Border color when not focused
          ),
          prefixIconColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade900), // Border color when focused
          ),
        ),
      );
    });
  }
}