import 'package:flutter/material.dart';
import 'package:fluttercleanarshitecture/core/constant/color.dart';
import 'package:fluttercleanarshitecture/core/constant/size_padding.dart';
import 'package:fluttercleanarshitecture/core/widget/button_login.dart';
import 'package:fluttercleanarshitecture/core/widget/text_form_input.dart';

class SetupForm extends StatefulWidget {
  @override
  _SetupFormState createState() => _SetupFormState();
}

class _SetupFormState extends State<SetupForm> {
  TextEditingController _hostController = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  void _validateInputs(){
    if(_formKey.currentState.validate()){
        _formKey.currentState.save();
        Navigator.of(context).pop();
    } else {
      setState(() {
          _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Aplication Setup'),
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 180,
                child: Card(
                  color: Colors.lightBlueAccent,
                  child: Form(
                    key: _formKey,
                      autovalidate: _autoValidate,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10,),
                          TextFormInput(
                            paddingForm: EdgeInsets.only(
                                top: 10,
                                left: PaddingConstant.formInput,
                                right: PaddingConstant.formInput),
                            hintText: "Host",
                            isEmail: false,
                            isPassword: false,
                            onSaved: (String val){
                                _hostController.text = val;
                            },
                            controllerName: _hostController,
                            validator: (String arg){
                                if (arg.isEmpty)
                                  return 'Mandatory field';
                                else
                                  return null;
                            }
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ButtonLogin(
                              color: ColorCustom.blueGradient,
                              textName: "Save",
                              onPress: () {
                                _validateInputs();
                              }),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
