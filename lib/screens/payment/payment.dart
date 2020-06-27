import 'package:app/constants/colors.dart';
import 'package:app/constants/customeprogress.dart';
import 'package:app/constants/strings.dart';
import 'package:app/constants/styles.dart';
import 'package:app/models/paymentmodel.dart';
import 'package:app/screens/homepage.dart';
import 'package:app/screens/marketplace.dart';
import 'package:app/screens/payment/paymentlistview.dart';
import 'package:app/screens/payment/search.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  @override
  Widget build(BuildContext context) {
//    final paymentmodel= Provider.of<PaymentModel>(context, listen: false);
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
      body: ChangeNotifierProvider(
          create: (context) => PaymentProvider(),
          child: Consumer<PaymentProvider>(builder: (context, model, child) {

//            if ( model.payGet.length == 0) {
//              return Center(child: Text("ctugvhib"));
//            }
            return ListView(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 30),
              children: <Widget>[
                SearchPayment(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  child:  ListView.builder(
                      itemCount: model.payGet.length,
                      shrinkWrap: true,
                      itemBuilder: (
                          BuildContext context,
                          int index,
                          ) {
                        print("uvghibkj");
                        return Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    CircularProfileAvatar(
                                      model.payGet[index].avatar,
                                      radius: 22,
                                      backgroundColor: Colors.grey,
                                      borderWidth: 0,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          model.payGet[index].name,
                                          style: Style.Worksans(
                                              ColorTheme.black, 15.0),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          model.payGet[index].description,
                                          style: Style.Roboto(
                                              ColorTheme.black, 15.0),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Align(
                                      child: Container(
                                        height: 30,
                                        width: 50,
                                        decoration: new BoxDecoration(
                                          color: ColorTheme.whiteColor,
                                          border: Border.all(
                                              color: Colors.red, width: 2.0),
                                          borderRadius:
                                          new BorderRadius.circular(15.0),
                                        ),
                                        child: Center(
                                            child: Text(
                                              model.payGet[index].price,style: Style.Worksans(ColorTheme.red, 15.0),)),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Divider(),
                          ],
                        );
                      }),
                )
              ],
            );
          })),
    );
  }
  @override
  void initState() {
    super.initState();
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
                child: Text(
                  searchtext,
                  style: Style.Worksans(ColorTheme.grey, 15.0),
                  textAlign: TextAlign.left,
                ),
              ),
            )));
  }
}
