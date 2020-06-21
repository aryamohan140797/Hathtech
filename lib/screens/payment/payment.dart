import 'package:app/constants/colors.dart';
import 'package:app/constants/strings.dart';
import 'package:app/constants/styles.dart';
import 'package:app/screens/homepage.dart';
import 'package:app/screens/marketplace.dart';
import 'package:app/screens/payment/paymentlistview.dart';
import 'package:app/screens/payment/search.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorTheme.whiteColor,
        elevation: 0.0,
        title: appbar(
          title: "Payments",
          image: "https://avatars0.githubusercontent.com/u/8264639?s=460&v=4",
          titleColor: ColorTheme.black,
          icon: Icons.arrow_forward_ios,
          iconColor: ColorTheme.black,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 30),
        children: <Widget>[
          SearchPayment(),
          SizedBox(
            height: 20,
          ),
          Paymentlist(),
        ],
      ),
    );
  }
}

class SearchPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: MediaQuery.of(context).size.height / 16,
        child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => new SeachList(),
                ),
              );
            },
            color: ColorTheme.lightgrey,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(searchtext,
                    style: Style.Worksans(ColorTheme.grey, 15.0),textAlign: TextAlign.left,),
              ),
            )));
  }
}
