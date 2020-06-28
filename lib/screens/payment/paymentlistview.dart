import 'package:app/constants/colors.dart';
import 'package:app/constants/styles.dart';
import 'package:app/models/paymentmodel.dart';
import 'package:app/services/apis.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class Paymentlist extends StatefulWidget {
  @override
  _PaymentlistState createState() => _PaymentlistState();
}

class _PaymentlistState extends State<Paymentlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: FutureBuilder<List<PaymentModel>>(
          future: Apis().paymentapi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: snapshot.data.length == 0
                    ? Center(
                    child: Text(
                      "no items",
                    ))
                    : ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (
                        BuildContext context,
                        int index,
                        ) {
                      return Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  CircularProfileAvatar(
                                    snapshot.data[index].avatar,
                                    radius: 22,
                                    backgroundColor: Colors.grey,
                                    borderWidth: 0,
                                  ),
                                ],
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          snapshot.data[index].name,
                                          style: Style.Worksans(
                                              ColorTheme.black, 15.0),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          snapshot.data[index].description,
                                          style: Style.Roboto(
                                              ColorTheme.black, 15.0),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
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
                                            snapshot.data[index].price,style: Style.Worksans(ColorTheme.red, 15.0),)),
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
              );
            }
            return Center(
              child: CircularProgressIndicator(
                  valueColor:
                  new AlwaysStoppedAnimation<Color>(ColorTheme.grey)),
            );
          }),
    );
  }
}