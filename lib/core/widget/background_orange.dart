import 'package:flutter/material.dart';
import 'package:fluttercleanarshitecture/core/constant/color.dart';

Widget BackgroundOrange(BuildContext context){
  return  Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: ColorCustom.orenGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
  );
}