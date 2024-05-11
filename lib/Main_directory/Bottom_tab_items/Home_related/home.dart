import 'package:ecommerceapp/Main_directory/Bottom_tab_items/cart_related/cart.dart';
import 'package:ecommerceapp/controllers/notify_controller.dart';
import 'package:ecommerceapp/widgets/circlevatar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/Main_directory/Main_screen_related/Carousel_Slider.dart';
import 'package:ecommerceapp/Main_directory/cloth_section/brand_container.dart';
import 'package:ecommerceapp/Main_directory/Bottom_tab_items/Home_related/cloth_container.dart';
import 'package:ecommerceapp/Main_directory/cloth_section/shirt_containers.dart';
import 'package:ecommerceapp/helpers/widget_helper.dart';
import 'package:get/get.dart';
class header_part extends StatelessWidget {
  notify_controller _controller2=Get.put(notify_controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ecommerce App"),
        iconTheme: IconThemeData(
          color: Colors.blueAccent.shade700,
        ),
        titleSpacing: 20,
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.black87,
        ),
        actions: [
          Stack(
            children: [
              Positioned(
                left: 6,
                child: CircleAvatar(
                  child: Obx((){
                    return Text(_controller2.no_of_products.toString(),style: TextStyle(color: Colors.white,fontSize: 10),);
                  }),
                  radius: 8,
                  backgroundColor: Colors.red,
                ),
              ),
              IconButton(onPressed: (){
                Get.to(add_cart());
              }, icon: Icon(Icons.add_shopping_cart),),
            ],
          ),
          IconButton(onPressed: (){
            _controller2.fetchData();
          }, icon: Icon(Icons.refresh),),
        ],
      ),
      body: Container(
          width: Get.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text_helper("Find Best Product",fontsize: 30,),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        label: text_helper("Search",),
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                  SizedBox(height: 20,),
                  Carousel_Slider(),
                  SizedBox(height: 20,),
                  text_helper("ALL TYPE OF CLOTHES", fontsize: 30,),
                  SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        cloth_container('assets/images/product_images/image1.jpg','Shirts',"Click for More",shirt_containers()),
                        SizedBox(width: 20,),
                        cloth_container('assets/images/product_images/image2.jpg','Jerses',"Click for More",shirt_containers()),
                        SizedBox(width: 20,),
                        cloth_container('assets/images/product_images/image3.jpg','Outing Shirts',"Click for More",shirt_containers()),
                        SizedBox(width: 20,),
                        cloth_container('assets/images/product_images/image4.jpg','Girls Jerses',"Click for More",shirt_containers()),
                        SizedBox(width: 20,),
                        cloth_container('assets/images/product_images/image5.jpg','Jackets',"Click for More",shirt_containers()),
                        SizedBox(width: 20,),
                        cloth_container('assets/images/product_images/image6.jpg','Girls Shirts',"Click for More",shirt_containers()),
                        SizedBox(width: 20,),
                        cloth_container('assets/images/product_images/image7.jpg','Informal Dress',"Click for More",shirt_containers()),
                        SizedBox(width: 20,),
                        cloth_container('assets/images/product_images/image8.jpg','Formal Jackets',"Click for More",shirt_containers()),
                        SizedBox(width: 10,),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  text_helper("All Brands", fontsize: 30,),
                  SizedBox(height: 30,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:Row(
                      children: [
                        brand_container('assets/images/brand_logos/logo1.jpg','Himani',"Click"),
                        SizedBox(
                          width: 10,
                        ),
                        brand_container('assets/images/brand_logos/logo2.jpg','Khaadi',"Click"),
                        SizedBox(
                          width: 10,
                        ),
                        brand_container('assets/images/brand_logos/logo3.jpg','YerselJac',"Click"),
                        SizedBox(
                          width: 10,
                        ),
                        brand_container('assets/images/brand_logos/logo4.png','Lous Vition',"Click"),
                        SizedBox(
                          width: 10,
                        ),
                        brand_container('assets/images/brand_logos/logo5.png','Dior Brand',"Click"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      )
    );
  }
}

class logo_container extends StatelessWidget {
  List<String> logos=[
    'assets/images/brand_logos/logo1.jpg',
    'assets/images/brand_logos/logo2.jpg',
    'assets/images/brand_logos/logo3.jpg',
    'assets/images/brand_logos/logo4.png',
    'assets/images/brand_logos/logo5.png',
    'assets/images/brand_logos/logo5.png',
    'assets/images/brand_logos/logo5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height*0.17,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: logos.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: circleavatar(logos[index],40,"logo1",Colors.black87),
              );
            }
        ),
      ),
    );
  }
}