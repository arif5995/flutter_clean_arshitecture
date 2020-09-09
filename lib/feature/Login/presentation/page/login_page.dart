import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttercleanarshitecture/core/constant/color.dart';
import 'package:fluttercleanarshitecture/core/constant/size_padding.dart';
import 'package:fluttercleanarshitecture/core/constant/size_text.dart';
import 'package:fluttercleanarshitecture/core/widget/background_orange.dart';
import 'package:fluttercleanarshitecture/core/widget/button_login.dart';
import 'package:fluttercleanarshitecture/core/widget/text_form_input.dart';
import 'package:fluttercleanarshitecture/feature/Login/presentation/bloc/login/login_bloc.dart';
import 'package:fluttercleanarshitecture/feature/Setup/presentation/page/setup_form_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isHidePass = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _togglePasswordVisibility() {
    setState(() {
        _isHidePass =! _isHidePass;
    });
  }

  void _loginProgress(){
    BlocProvider.of<LoginBloc>(context).add(
      LoginEventFormSubmit(
        username: _emailController.text,
        password: _passwordController.text
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state){
        if(state is LoginStateFailed){
          _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text('${state.message}'),
                backgroundColor: Colors.red,
            )
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            body: Stack(
              children: [
                BackgroundOrange(context),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: state is LoginStateLoading
                      ? SpinKitFadingCircle(color: Colors.blue[100], size: 70)
                      : null,
                ),
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
                          color: ColorCustom.redGradient,
                          textName: "Login",
                          onPress: () {
                            _loginProgress();
                          }),
                      SizedBox(
                        height: 5,
                      ),
                      ButtonLogin(
                          color: ColorCustom.blueGradient,
                          textName: "Aplication Setup",
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SetupForm()),
                            );
                          }),
                      SizedBox(
                        height: 60,
                      )
//                      Align(
//                        alignment: Alignment.centerRight,
//                        child: Padding(
//                          padding:
//                          const EdgeInsets.only(top: 10, bottom: 50, right: 35),
//                          child: GestureDetector(
//                              onTap: () {},
//                              child: Text(
//                                "Lupa Password?",
//                                style: TextStyle(
//                                    fontSize: SizeConstant.textContentMin,
//                                    fontWeight: FontWeight.bold,
//                                    color: Colors.blue,
//                                    fontFamily: "Product-Sans"),
//                              )),
//                        ),
//                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
