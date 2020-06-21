import 'dart:convert';
import 'package:app/models/paymentmodel.dart';
import 'package:app/models/searchmodel.dart';
import 'package:http/http.dart' as http;

class Apis {
  Future<List<PaymentModel>> paymentapi() async {
    String uri = "https://run.mocky.io/v3/63c4c051-0a09-4456-8ca9-f449f073ef77";

    var response = await http.get(
      Uri.encodeFull(uri),
    );
    print("payment" + response.body.toString());
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      return (items['results'] as List)
          .map((li) => PaymentModel.fromJson(li))
          .toList();
    } else {
      print("exception" + response.body.toString());
      throw Exception('Failed to load internet');
    }
  }

  Future<List<Searchmodel>> searchapi(String mi) async {
    String uri = "https://run.mocky.io/v3/aeba2f37-64e0-476c-9ea9-865a63d659c5";

    var response = await http.get(
      Uri.encodeFull(uri),
    );
    print("payment" + response.body.toString());
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      return (items['results'] as List)
          .map((li) => Searchmodel.fromJson(li))
          .toList();
    } else {
      print("exception" + response.body.toString());
      throw Exception('Failed to load internet');
    }
  }
}
