import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class Carousel_Slider extends StatefulWidget {
  const Carousel_Slider({super.key});

  @override
  State<Carousel_Slider> createState() => _Carousel_SliderState();
}

class _Carousel_SliderState extends State<Carousel_Slider> {
  final List<String> ImagePaths = [
    "assets/images/product_images/image4.jpg",
    "assets/images/product_images/image2.jpg",
    "assets/images/product_images/image3.jpg",
    "assets/images/product_images/image4.jpg",
    "assets/images/product_images/image5.jpg",
    "assets/images/product_images/image6.jpg",
    "assets/images/product_images/image7.jpg",
    "assets/images/product_images/image8.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return   CarouselSlider(
      items: ImagePaths.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: Get.width,
              margin: EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                color: Colors.black38,
              ),
              child: Image(
                image: AssetImage(url),
                fit: BoxFit.fill,
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true, // Auto-play the carousel
        enlargeCenterPage: true,
        aspectRatio: 16/9,
        onPageChanged: (index, reason) {
        },
      ),
    );
  }
}
