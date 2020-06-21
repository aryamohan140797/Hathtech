
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
