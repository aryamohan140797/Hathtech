
import 'package:app/constants/colors.dart';
import 'package:app/constants/styles.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  String name;
  String price;
  String image;
  CryptoCard({this.name,this.price,this.image});
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center,

      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: const Offset(4, 4),
                blurRadius: 16,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.7 / 1,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            left: MediaQuery.of(context).size.width/10,
            top: 10,
            child: Text(name,style: Style.Worksans(ColorTheme.whiteColor, 20.0),)),
        Center(
            heightFactor: 4.5,
            child: Text(price,style: Style.Worksans(ColorTheme.whiteColor, 35.0),)),
      ],
    );
  }
}
