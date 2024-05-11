import 'dart:io';
import 'package:ecommerceapp/Authentications/Complete_data.dart';
import 'package:ecommerceapp/controllers/ImageController.dart';
import 'package:ecommerceapp/first_directory/form_fields.dart';
import 'package:ecommerceapp/helpers/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class complete_data extends StatefulWidget {
  @override
  State<complete_data> createState() => _complete_dataState();
}

class _complete_dataState extends State<complete_data> {
  TextEditingController _NameController = TextEditingController();
  TextEditingController _UserController = TextEditingController();
  TextEditingController _GenderController = TextEditingController();
  TextEditingController _AgeController = TextEditingController();
  TextEditingController _NumberController = TextEditingController();
  User_Data _user_data= new User_Data();
  ImageController image_controller = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Fill This Form",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: Get.width,
          height: Get.height,
          color: Colors.black87,
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height * 0.35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() {
                      return InkWell(
                        onTap: () {
                          image_controller.getImage();
                        },
                        child: CircleAvatar(
                          backgroundImage: image_controller.image_path.isNotEmpty
                              ? FileImage(File(image_controller.image_path.toString(),),)
                              : null,
                          radius: 80,
                        ),
                      );
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    text_helper("Add Profile Picture",fontweight: FontWeight.w700,fontsize: 17,color: Colors.white,),
                  ],
                ),
              ),
              Container(
                width: Get.width,
                height: Get.height * 0.56,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        form_field(
                            TextInputType.text,
                            Colors.white38,
                            Text("Full Name"),
                            Icon(Icons.drive_file_rename_outline),
                            _NameController),
                        form_field(
                            TextInputType.text,
                            Colors.white38,
                            Text("UserName"),
                            Icon(Icons.account_circle_rounded),
                            _UserController),
                        form_field(
                            TextInputType.number,
                            Colors.white38,
                            Text("Age"),
                            Icon(Icons.real_estate_agent_sharp),
                            _AgeController),
                        form_field(
                            TextInputType.text,
                            Colors.white38,
                            Text("Gender"),
                            Icon(Icons.transgender_outlined),
                            _GenderController),
                        form_field(
                            TextInputType.number,
                            Colors.white38,
                            Text("Mobile Number"),
                            Icon(Icons.phone),
                            _NumberController),
                        ElevatedButton(
                          onPressed: () {
                              _user_data.add_user_data(
                              _NameController.text.trim().toString(),
                              _UserController.text.trim().toString(),
                              _GenderController.text.trim().toString(),
                              _AgeController.text.trim().toString(),
                                _NumberController.text.trim().toString(),
                                File(
                                  image_controller.image_path.toString(),
                                ));
                          },
                          child: Text("Add Data"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
