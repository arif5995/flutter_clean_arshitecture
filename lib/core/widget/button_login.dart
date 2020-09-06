import 'package:flutter/material.dart';
import 'package:fluttercleanarshitecture/core/constant/color.dart';
import 'package:fluttercleanarshitecture/core/constant/size_circular.dart';
import 'package:fluttercleanarshitecture/core/constant/size_padding.dart';
import 'package:fluttercleanarshitecture/core/constant/size_text.dart';

Widget ButtonLogin({Function onPress, String textName}) {
  return Padding(
    padding: EdgeInsets.only(
        top: PaddingConstant.formInput,
        left: PaddingConstant.formInput,
        right: PaddingConstant.formInput),
    child: RaisedButton(
      onPressed: onPress,
      splashColor: Colors.red[200],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CircularContstant.circularForm)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: ColorCustom.redGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius:
            BorderRadius.circular(CircularContstant.circularForm)),
        child: Container(
          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            textName,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: SizeConstant.textContentMedium,
                fontFamily: "Product-Sans"),
          ),
        ),
      ),
    ),
  );
}
