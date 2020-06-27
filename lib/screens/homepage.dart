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
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _congratulations(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
//            CryptoCard(8
//              image: "assets/images/purple.jpg",
//              price: "\$158.0",
//              name: cryptotext,
//            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.85,
              width: MediaQuery.of(context).size.width,
              child: SwipeStack(
                children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((int index) {
                  return SwiperItem(
                      builder: (SwiperPosition position, double progress) {
                    return Material(
                        elevation: 4,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Container(
                            child: Center(
                              child: Text("\$158.0",
                                  style: Style.Worksans(
                                      ColorTheme.whiteColor, 25.0)),
                            ),
                            height: 190.0,
                            width: MediaQuery.of(context).size.width - 100.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
//                        color: Colors.blue,
                                image: DecorationImage(
                                    image: new NetworkImage(
                                        "https://eu.community.samsung.com/t5/image/serverpage/image-id/156393iE783AA327643ADFE/image-size/large?v=1.0&px=999"),
                                    fit: BoxFit.fill)),
                          ),

//                                Container(
//                                  height: MediaQuery.of(context).size.height/3,
//                                  width: MediaQuery.of(context).size.width,
//
//                                  child: ClipRRect(
//                                      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
//                                      child: FittedBox(
//                                        fit: BoxFit.fill,
////                                            aspectRatio: 1.5/1.12,
//                                          child: Image.asset("assets/images/purple.jpg",fit: BoxFit.fill,))),
//                                ),
//                            )
                        ));
                  });
                }).toList(),
                visibleCount: 3,
                stackFrom: StackFrom.Top,
                translationInterval: 6,
                scaleInterval: 0.03,
                onEnd: () => debugPrint("onEnd"),
                onSwipe: (int index, SwiperPosition position) =>
                    debugPrint("onSwipe $index $position"),
                onRewind: (int index, SwiperPosition position) =>
                    debugPrint("onRewind $index $position"),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
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
              ),
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
        Text(
          title,
          style: Style.Worksans(titleColor, 20.0),
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
