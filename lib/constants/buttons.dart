import 'package:app/constants/colors.dart';
import 'package:app/constants/strings.dart';
import 'package:app/constants/styles.dart';
import 'package:flutter/material.dart';

// Buttons

class Iconbuttons extends StatelessWidget {
  IconData icon;
  Color iconColor;
  double iconsize;
  VoidCallback onPressed;
  Iconbuttons({this.icon, this.iconColor, this.iconsize,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          this.onPressed();
        },
        child: Icon(
          icon,
          color: iconColor,
          size: iconsize,
        ),
      ),
    );
  }
}

class Rawbutton extends StatelessWidget {
  Color buttonColor;
  String title;
  VoidCallback onPressed;

  Rawbutton({this.title, this.buttonColor,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 18,
      width: MediaQuery.of(context).size.width / 2.3,
      child: FlatButton(
        onPressed: () {
          this.onPressed();
        },
        color: buttonColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(color: buttonColor)),
        padding: EdgeInsets.all(10.0),
        child: Text(
          title,
          style: Style.Worksans(ColorTheme.whiteColor, 15.0),
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  IconData icon;
  Color iconColor;
  double iconsize;

  RoundButton({this.iconsize, this.iconColor, this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: new Icon(
        icon,
        color: iconColor,
        size: iconsize,
      ),
      shape: new CircleBorder(),
      fillColor: ColorTheme.lightgrey,
    );
  }
}

class Featured extends StatelessWidget {
  String mainTitle;
  String name1;
  String name2;
  String price1;
  String price2;

  Featured({this.mainTitle, this.name1, this.name2, this.price1, this.price2});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Text(mainTitle,style: Style.Roboto(ColorTheme.grey, 15.0),),
          SizedBox(height: MediaQuery.of(context).size.height/18,),

          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/icon.jpg",height: 50,),
                ],
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            name1,style: Style.Worksans(ColorTheme.black, 15.0),),
                        SizedBox(width: MediaQuery.of(context).size.width/2,),
                        Text(price1,style: Style.Worksans(ColorTheme.black, 15.0)),
                      ],
                    ),
                    SizedBox(height: 5.0,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            name2,style: Style.Roboto(ColorTheme.grey, 13.0),),
                        SizedBox(width: MediaQuery.of(context).size.width/2,),
                        Text(price2,style: Style.Roboto(ColorTheme.grey, 13.0),),
                      ],
                    ),
                  ]
              ),
            ],
          ),
          Divider(
            color: ColorTheme.lightgrey,
            thickness: 1.5,
          ),
        ],
      );




  }
}
