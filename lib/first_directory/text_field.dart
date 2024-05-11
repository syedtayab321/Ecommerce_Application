import 'package:flutter/material.dart';

class text_field extends StatefulWidget {
   TextInputType? type;
   Color? fillcolor;
   Color? bordercolor;
   Text? label;
   Icon? suffixicon;
   Icon? prefixicon;
   TextEditingController _textcontroller;
   text_field(this.type,this.fillcolor,this.label,this.prefixicon,this._textcontroller,{this.suffixicon,this.bordercolor});
  @override
  State<text_field> createState() => _text_fieldState();
}

class _text_fieldState extends State<text_field> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.type,
      controller: widget._textcontroller,
      style: TextStyle(color: Colors.white,fontSize: 16),
      decoration: InputDecoration(
        fillColor: widget.fillcolor,
        filled: true,
        label: widget.label,
        labelStyle: TextStyle(color: Colors.white),
        suffixIcon: widget.suffixicon,
        suffixIconColor: Colors.white,
        prefixIcon: widget.prefixicon,
        prefixIconColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Border color when not focused
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent), // Border color when focused
        ),
      ),
    );
  }
}
