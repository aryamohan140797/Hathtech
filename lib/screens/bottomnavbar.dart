import 'package:app/constants/colors.dart';
import 'package:app/constants/strings.dart';
import 'package:app/main.dart';
import 'package:app/screens/homepage.dart';
import 'package:app/screens/marketplace.dart';
import 'package:app/screens/payment/payment.dart';
import 'package:flutter/material.dart';

import 'Scan.dart';

class Bottomnavigation extends StatefulWidget {
  int index = 0;

  Bottomnavigation({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BottomnavigationState();
  }
}

class BottomnavigationState extends State<Bottomnavigation> {
  bool popupFlag = false;
  int currentTabIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> tabs = [
    Homepage(),
    Payment(),
    Scan(),
    Scan(),
  ];

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  BottomnavigationState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: tabs.elementAt(currentTabIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              hometext,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.payment,
            ),
            title: Text(
              paymentstext,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.scanner,
              size: 30.0,
            ),
            title: Text(
              scantext,
            ),

          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.disc_full,
              size: 30.0,
            ),
            title: Text(
              discovertext,
            ),

          ),
        ],
        type: BottomNavigationBarType.fixed,
        onTap: onTapped,
        unselectedItemColor: Colors.grey,
        selectedItemColor: ColorTheme.purple,
        currentIndex: currentTabIndex,
      ),
    );
  }
}
