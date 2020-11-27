import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keka_hunt/models/clue_model.dart';
import 'package:keka_hunt/models/game_details.dart';
import 'package:keka_hunt/utilities/codescan_utility.dart';
import 'package:keka_hunt/utilities/http_utility.dart';
import 'package:keka_hunt/utilities/local_storage_utility.dart';
import 'package:keka_hunt/widgets/invalid_alert.dart';

import 'clue_details_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CodeScanner scanner = CodeScanner();

  List<ClueModel> data = [];

  GlobalKey<AnimatedListState> key = GlobalKey<AnimatedListState>();

  HttpUtility _httpUtility = HttpUtility();
  StorageUtility storageUtility = StorageUtility();
  GameDataModel model;

  Timer timer;

  @override
  void initState() {
    super.initState();

    _loadLocalData().then((_) {
      _loadData();
      startTimer();
    });
  }

  void _scanClue() async {
    String clueId = await scanner.scan(context);
    print(clueId);

    if (clueId == null) {
      showDialog(
          context: context,
          builder: (context) => InvalidData(
                message: "Invalid Data",
              ));
    } else {
      print("Making request:");

      String data = GameDataModelJsonSerializer().toMap(model).toString();
      print("User Details: $data");
      _validateQR(clueId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background_new.jpg"),
                fit: BoxFit.cover)),
        child: SafeArea(child: _getClueListWidget()),
      ),
      floatingActionButton: _getFAB(),
    );
  }

  Widget _getFAB() {
    return FloatingActionButton.extended(
      label: Text(
        "Scan a Clue",
        style: TextStyle(fontFamily: "Pirata"),
      ),
      backgroundColor: Colors.black,
      onPressed: _scanClue,
      tooltip: 'Found a Clue? Tap to scan',
      isExtended: true,
      icon: Image.asset(
        "assets/images/codescan.png",
        height: 30,
        width: 30,
        color: Colors.white,
      ),
    );
  }

  Widget _getClueListWidget() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/map_scroll.png"),
        ),
      ),
      child: Container(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.85,
            maxHeight: MediaQuery.of(context).size.height * 0.55),
        child: RefreshIndicator(
          onRefresh: () async {
            _loadData();
          },
          child: ListView.builder(
              key: key,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: data.length,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      _openClue(data[index]);
                    },
                    child: _getClueItemWidget("Clue $index"));
              }),
        ),
      ),
    );
  }

  Widget _getClueItemWidget(String title) {
    return Container(
      color: Colors.transparent,
      child: Column(children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Row(children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/clue.png",
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontFamily: "Pirata", fontSize: 30),
                  )
                ],
              )
            ])),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          height: 1,
          color: Colors.black,
        ),
      ]),
    );
  }

  void _openClue(ClueModel clueModel) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ClueDetailsPage(clueModel)));
  }

  Future<void> _loadLocalData() async {
    model = await storageUtility.getGameDataModel();
  }

  Future<void> _loadData() async {
    data.clear();

    data = await _httpUtility.getRequest(
        "game/${model.gameId}/team/${model.teamId}",
        {
          'gameId': model.gameId,
          'teamId': model.teamId,
        },
        ClueModelJsonSerializer(),
        isList: true);

    print(data.length);

    if (data != null && mounted) {
      setState(() {});
    }
  }

  Future<void> _validateQR(String clueId) async {
    ClueModel clue = await _httpUtility.postRequest(
      "scan/$clueId",
      <String, dynamic>{
        'id': model.id,
        'gameId': model.gameId,
        'teamId': model.teamId,
      },
      ClueModelJsonSerializer(),
    );

    if (clue != null) {
      bool isExistingClue = data.any((item) => item.id == clue.id);
      if (!isExistingClue && mounted)
        setState(() {
          data.add(clue);
        });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClueDetailsPage(clue),
        ),
      );
      print("Clue Order ${clue.order}");
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 15), (_) => _loadData());
  }

  @override
  void dispose() {
    if (timer?.isActive ?? false) {
      timer.cancel();
    }
    super.dispose();
  }
}
