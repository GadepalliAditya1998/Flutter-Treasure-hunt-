import 'package:flutter/material.dart';
import 'package:keka_hunt/models/qr_data_model.dart';
import 'package:majascan/majascan.dart';

class CodeScanner {
  QRDataModelJsonSerializer qrDataModelJsonSerializer =
      new QRDataModelJsonSerializer();
  Future<dynamic> scan(BuildContext context) async {
    String qrResult = await MajaScan.startScan(
        title: "Keka Hunt",
        barColor: Theme.of(context).primaryColor,
        titleColor: Colors.white,
        qRCornerColor: Theme.of(context).primaryColor,
        qRScannerColor: Colors.deepPurple,
        flashlightEnable: true);

    return qrResult;
  }
}
