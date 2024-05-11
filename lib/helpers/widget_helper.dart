import 'package:flutter/material.dart';

class text_helper extends StatelessWidget {
  String text;
  Color? color;
  double? fontsize;
  FontWeight? fontweight;
  double? letterspacing;
  text_helper(this.text,{this.color,this.fontsize,this.fontweight,this.letterspacing});
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: color,fontSize: fontsize,fontWeight: fontweight,letterSpacing: letterspacing),);
  }
}
