import 'package:app/constants/colors.dart';
import 'package:app/constants/styles.dart';
import 'package:flutter/material.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Nothing here",style: Style.Worksans(ColorTheme.black, 20.0),),
      )
    );
  }
}
