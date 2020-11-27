import 'package:flutter/material.dart';

class InvalidData extends StatefulWidget {
  final String message;

  const InvalidData({this.message});

  @override
  State<StatefulWidget> createState() {
    return InvalidDataState();
  }
}

class InvalidDataState extends State<InvalidData>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    animation = Tween<double>(begin: 1, end: 2).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              _getMessageWidget(),
              Transform.scale(
                scale: animation.value,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.close),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _getMessageWidget() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.yellow,
      ),
      child: Text(
        widget.message,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
