import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/image_properties.dart';
import 'package:keka_hunt/models/clue_model.dart';

class ClueDetailsPage extends StatefulWidget {
  final ClueModel clue;
  ClueDetailsPage(this.clue);

  @override
  _ClueDetailsPageState createState() => _ClueDetailsPageState();
}

class _ClueDetailsPageState extends State<ClueDetailsPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.clue);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_new.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: _getMessageWidget(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop();
        },
        label: Text(
          "Go Back",
          style: TextStyle(
            fontFamily: "Pirata",
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }

  Widget _getMessageWidget() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/map_scroll.png"),
        ),
      ),
      child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.80,
              maxHeight: MediaQuery.of(context).size.height * 0.50),
          child: _getHTMLParser()),
    );
  }

  Widget _getHTMLParser() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Html(
        defaultTextStyle: TextStyle(
          fontFamily: "Pirata",
          color: Colors.black,
          fontSize: 28,
        ),
        useRichText: true,
        data: widget.clue.title,
        imageProperties: ImageProperties(
            alignment: Alignment.center,
            scale: 1,
            fit: BoxFit.fitHeight,
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.80),
      ),
    );
  }
}
