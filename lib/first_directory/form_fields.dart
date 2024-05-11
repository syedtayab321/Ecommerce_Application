import 'package:flutter/material.dart';

class form_field extends StatefulWidget {
   TextInputType? type;
   Color? fillcolor;
   Color? bordercolor;
   Text? label;
   Icon? suffixicon;
   Icon? prefixicon;
   TextEditingController _textcontroller;
   form_field(this.type,this.fillcolor,this.label,this.prefixicon,this._textcontroller,{this.suffixicon,this.bordercolor});
  @override
  State<form_field> createState() => _form_fieldState();
}

class _form_fieldState extends State<form_field> {


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
          borderSide: BorderSide(color: Colors.transparent), // Border color when not focused
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
