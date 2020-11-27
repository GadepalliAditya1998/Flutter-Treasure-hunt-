import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keka_hunt/models/game_details.dart';
import 'package:keka_hunt/models/user_model.dart';
import 'package:keka_hunt/pages/home.dart';
import 'package:keka_hunt/utilities/http_utility.dart';
import 'package:keka_hunt/utilities/local_storage_utility.dart';
import 'package:keka_hunt/widgets/alert.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  StorageUtility storageUtility = StorageUtility();
  HttpUtility httpUtility = HttpUtility();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/login.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter your name",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: "Pirata"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: emailController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter Email ",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: "Pirata"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: pinController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter Team Pin",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: "Pirata"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        validateFunction();
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: "Pirata",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> validateFunction() async {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        pinController.text.isNotEmpty) {
      _showLoadingDialog();
      UserModel userModel = UserModel(nameController.text, emailController.text,
          int.parse(pinController.text));

      Map map = UserModelJsonSerializer().toMap(userModel);
      print(map.toString());

      GameDataModel _gameData = await httpUtility.postRequest(
          HttpUtility.userDetails,
          json.encode(map),
          GameDataModelJsonSerializer());

      _closeDialog();

      if (_gameData != null) {
        await storageUtility.setGameDataModel(_gameData);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      } else
        showDialog(
          context: context,
          builder: (context) => PirateAlert(message: "Invalid Login"),
        );
    } else
      showDialog(
          context: context,
          builder: (context) => PirateAlert(
              message:
                  "Pirate! You have to fill all your details to start sailing"),
          barrierDismissible: false);
  }

  void _showLoadingDialog() {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ),
        barrierDismissible: false);
  }

  void _closeDialog() {
    Navigator.pop(context);
  }
}
