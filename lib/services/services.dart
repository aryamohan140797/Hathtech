

import 'package:app/models/paymentmodel.dart';

import 'apis.dart';

class Services {
  @override
  Future<List<PaymentModel>> fetchPayment(
      {avatar, name, price, description}) async {
    return Apis().paymentapi();
  }
}
