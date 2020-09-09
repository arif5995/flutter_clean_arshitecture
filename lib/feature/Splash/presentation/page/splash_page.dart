import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttercleanarshitecture/core/widget/background_orange.dart';
import 'package:fluttercleanarshitecture/feature/Login/presentation/page/login_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //_delay(context);
    return Scaffold(
      body: Stack(
        children: [
          BackgroundOrange(context),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/opus_b.png",
                  height: 100,
                  width: 200,
                ),
                Text('Do Simply Job',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Product-Sans")),
              ],
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: SpinKitFoldingCube(
                size: 50.0,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


void _delay(BuildContext context) {
  Future<void>.delayed(const Duration(seconds: 5), () {
    Navigator
        .of(context)
        .pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => LoginPage()));
    }
  );
}