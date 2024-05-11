import 'package:flutter/material.dart';

class circleavatar extends StatelessWidget {
  String image;
  double?  radius;
  String name;
  Color? color;
  circleavatar(this.image,this.radius,this.name,this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: radius,
            backgroundColor: Colors.transparent,
          ),
          SizedBox(height: 10,),
          Text(name,style: TextStyle(color: color),),
        ],
      ),
    );
  }
}
