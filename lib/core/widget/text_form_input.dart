import 'package:flutter/material.dart';
import 'package:fluttercleanarshitecture/core/constant/size_circular.dart';
import 'package:fluttercleanarshitecture/core/constant/size_text.dart';

Widget TextFormInput(
    {String hintText,
      bool isPassword,
      Function onSaved,
      bool isEmail,
      EdgeInsets paddingForm,
      TextEditingController controllerName,
      GestureDetector pass}) {
  return Padding(
    padding: paddingForm,
    child: TextFormField(
      style: TextStyle(fontFamily: "Product-Sans", fontSize: SizeConstant.textInput),
      decoration: InputDecoration(
        suffixIcon: pass,
        hintText: hintText,
        contentPadding: EdgeInsets.all(15.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(CircularContstant.circularForm),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.white,
      ),
      obscureText: isPassword,
      controller: controllerName,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
    ),
  );
}
