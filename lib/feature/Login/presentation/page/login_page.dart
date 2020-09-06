import 'package:flutter/material.dart';
import 'package:fluttercleanarshitecture/core/constant/size_padding.dart';
import 'package:fluttercleanarshitecture/core/constant/size_text.dart';
import 'package:fluttercleanarshitecture/core/widget/background_orange.dart';
import 'package:fluttercleanarshitecture/core/widget/button_login.dart';
import 'package:fluttercleanarshitecture/core/widget/text_form_input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isHidePass = true;

  void _togglePasswordVisibility() {
    setState(() {
        _isHidePass =! _isHidePass;
    });
  }

  void _loginProgress(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundOrange(context),
          Align(
            alignment: Alignment.topCenter,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100.0,
                  ),
                  Image.asset(
                    "assets/images/opus_b.png",
                    height: 100,
                    width: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      "Do simply job",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: "Product-Sans"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // start at end/bottom of column
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormInput(
                    paddingForm: EdgeInsets.only(
                        top: 10,
                        left: PaddingConstant.formInput,
                        right: PaddingConstant.formInput),
                    hintText: "Email",
                    isEmail: true,
                    isPassword: false,
                    controllerName: _emailController),
                SizedBox(
                  height: 20,
                ),
                TextFormInput(
                    paddingForm: EdgeInsets.only(
                        top: 10,
                        left: PaddingConstant.formInput,
                        right: PaddingConstant.formInput),
                    hintText: "Password",
                    isEmail: false,
                    isPassword: _isHidePass,
                    controllerName: _passwordController,
                    pass: GestureDetector(
                      onTap: () => _togglePasswordVisibility(),
                      child: Icon(
                        _isHidePass ? Icons.visibility_off : Icons.visibility,
                        color: _isHidePass ? Colors.grey[300] : Colors.black,
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                ButtonLogin(
                    textName: "Login",
                    onPress: () {
                      _loginProgress();
                    }),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(top: 10, bottom: 50, right: 35),
                    child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Lupa Password?",
                          style: TextStyle(
                              fontSize: SizeConstant.textContentMin,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontFamily: "Product-Sans"),
                        )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
