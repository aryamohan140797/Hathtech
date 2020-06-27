// Model class for api
import 'package:app/services/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


class PaymentProvider with ChangeNotifier{
  Services _service = Services();
  List<PaymentModel> payGet=[];
  Map<String, PaymentModel> paymentList = {};

  bool isLoading = true;
  String message;
  void getPaymentdetails({avatar,name,price,description}) async {
    try {

      payGet = await _service.fetchPayment(avatar:avatar,name: name,price: price,description: description);
      isLoading = false;
      message = null;

      notifyListeners();
    } catch (err) {
      message =
          "There is an issue with the app during request the data, please contact admin for fixing the issues " +
              err.toString();
      notifyListeners();
    }
  }


}


class PaymentModel {
  String avatar;
  String name;
  String price;
  String description;

  PaymentModel({this.avatar, this.name, this.price, this.description});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    return data;
  }
}
