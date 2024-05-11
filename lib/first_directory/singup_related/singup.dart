import 'package:ecommerceapp/Authentications/Sing_Up.dart';
import 'package:ecommerceapp/helpers/widget_helper.dart';
import 'package:ecommerceapp/first_directory/password_field.dart';
import 'package:ecommerceapp/first_directory/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class singup extends StatelessWidget {
  GlobalKey<FormState> _formkey=GlobalKey<FormState>();

  TextEditingController _email_controller=TextEditingController();
  TextEditingController _password_controller=TextEditingController();
  TextEditingController _confirmpassword_controller=TextEditingController();
  Singup singUp=new Singup();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: Get.width,
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height*0.6,
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text_helper("READY TO CREATE YOUR ACCOUNT" ,fontsize: 40),
                        SizedBox(height: 20,),
                        text_field(TextInputType.text, Colors.transparent, Text("Email"), Icon(Icons.email),_email_controller),
                        SizedBox(height: 20,),
                        password_field(TextInputType.text, Colors.transparent, Text("Password"), Icon(Icons.password),_password_controller),
                        SizedBox(height: 20,),
                        password_field(TextInputType.text, Colors.transparent, Text("Confirm Password"), Icon(Icons.password),_confirmpassword_controller),
                        SizedBox(height: 30,),
                        Container(
                          width: Get.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
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
                              singUp.sing_up(_email_controller.text.trim(),_password_controller.text.trim());
                            },
                            child: text_helper("Create Account",fontsize: 25,fontweight: FontWeight.w500,letterspacing: 3,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(thickness: 1,color: Colors.black26,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

