import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keka_hunt/models/game_details.dart';
import 'package:keka_hunt/pages/home.dart';
import 'package:keka_hunt/pages/login_page.dart';
import 'package:keka_hunt/utilities/local_storage_utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StorageUtility storageUtility = StorageUtility();
  UniqueKey key;
  GameDataModel _gameDataModel;
  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keka Hunt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _gameDataModel == null ? LoginPage() : MyHomePage(),
    );
  }

  Future<void> _loadUserDetails() async {
    _gameDataModel = await storageUtility.getGameDataModel();
    if (mounted) setState(() {});
  }
}
