import 'package:app/constants/buttons.dart';
import 'package:app/constants/colors.dart';
import 'package:app/constants/strings.dart';
import 'package:app/constants/styles.dart';
import 'package:app/screens/card.dart';
import 'package:flutter/material.dart';

class Marketplace extends StatefulWidget {
  @override
  _MarketplaceState createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: ColorTheme.whiteColor,
        title: Text(
          marketplacetext,
          style: Style.Worksans(ColorTheme.black, 25.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Search(),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              color: ColorTheme.lightgrey,
              thickness: 1.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),

            Align(
              alignment: Alignment.center,
              child: CryptoCard(
                name: "Crypto",
                price: "\$ 158.0",
                image: "assets/images/purple.jpg",
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Divider(
              color: ColorTheme.lightgrey,
              thickness: 1.5,
            ),

//            SizedBox(height: MediaQuery.of(context).size.height/20,),

            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Featured(
                    mainTitle: featuredtext,
                    name1: metaltext,
                    name2: "MTL",
                    price1: "\$" + "133.27",
                    price2: "240.29 MTL",
                  )),
            )
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 17,
          width: MediaQuery.of(context).size.width / 1.2,
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: TextField(
              autofocus: true,
              cursorColor: ColorTheme.grey,
              decoration: InputDecoration(
                hintText: searchhinttext,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorTheme.whiteColor),
                ),
                hoverColor: ColorTheme.grey,
                focusColor: ColorTheme.grey,
                hintStyle: Style.Roboto(ColorTheme.grey, 15.0),
              ),
            ),
          ),
        ),
        Iconbuttons(
          icon: Icons.search,
          iconColor: ColorTheme.grey,
        )
      ],
    );
  }
}
