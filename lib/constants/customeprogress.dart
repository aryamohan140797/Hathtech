import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';

Widget customProgress(){
  return Center(
    child: CircularProgressIndicator(
        valueColor:new AlwaysStoppedAnimation<Color>(ColorTheme.grey)
    ),
  );
}