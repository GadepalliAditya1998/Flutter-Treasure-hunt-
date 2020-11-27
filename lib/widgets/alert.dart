import 'package:flutter/material.dart';

class PirateAlert extends StatelessWidget {
  final String message;
  PirateAlert({this.message = ""});
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _getMessageWidget(context),
              _getPirateImage(context),
            ],
          ),
        ));
  }

  Widget _getMessageWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: MediaQuery.of(context).size.height * 0.30,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 50,
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    fontFamily: "Pirata",
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _getPirateImage(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.23,
      child: Image.asset(
        "assets/images/skull.png",
        height: 150,
        width: 150,
      ),
    );
  }
}
