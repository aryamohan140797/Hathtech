import 'package:app/constants/buttons.dart';
import 'package:app/constants/colors.dart';
import 'package:app/constants/strings.dart';
import 'package:app/constants/styles.dart';
import 'package:app/screens/card.dart';
import 'package:app/screens/marketplace.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:swipe_stack/swipe_stack.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorTheme.whiteColor,
        title: appbar(
          title: metaltext,
          image: "https://avatars0.githubusercontent.com/u/8264639?s=460&v=4",
          titleColor: ColorTheme.purple,
          icon: Icons.card_giftcard,
          iconColor: ColorTheme.purple,
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _congratulations(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: Stack(
                children: <Widget>[
                  CryptoCard(
                    image: "assets/images/purple.jpg",
                    price: "\$158.0",
                    name: cryptotext,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: CryptoCard(
                      image: "assets/images/gate.jpg",
                      price: "\$450",
                      name: cashtext,
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Rawbutton(
                  onPressed: () {
                    _moveTo();
                  },
                  title: requesttext,
                  buttonColor: ColorTheme.purple,
                ),
                SizedBox(
                  width: 15,
                ),
                Rawbutton(
                  title: senttext,
                  buttonColor: ColorTheme.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _moveTo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => new Marketplace(),
      ),
    );
  }
}

class appbar extends StatelessWidget {
  String image;
  String title;
  Color titleColor;
  IconData icon;
  Color iconColor;

  appbar({this.title, this.image, this.titleColor, this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CircularProfileAvatar(
          image,
          radius: 25,
          backgroundColor: Colors.grey,
          borderWidth: 0,
        ),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: Style.Worksans(titleColor, 20.0),
            ),
          ),
        ),
        RoundButton(
          icon: icon,
          iconColor: iconColor,
          iconsize: 20.0,
        )
      ],
    );
  }
}

Widget _congratulations() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Column(
        children: <Widget>[
          Text(
            congratulations,
            style: Style.Worksans(ColorTheme.black, 18.0),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            earnedtext,
            style: Style.Worksans(ColorTheme.black, 15.0),
          )
        ],
      ),
      Image.asset(
        "assets/images/yellowdrop.png",
        height: 70,
//        width: 130,
      ),
    ],
  );
}
