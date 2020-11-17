import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'markets.dart';
import 'products.dart';


Future<CouintAPI> fetchAPI(http.Client client) async {
  final response = await client.get('https://couint.com/api/products');

  return compute(parseAPI, response.body);

}
CouintAPI parseAPI(String responseBody) {
  final parsed = jsonDecode(responseBody);

  CouintAPI couintAPI = CouintAPI.fromJson(parsed);
  // print(couintAPI.toString());
  return couintAPI;
}


class CouintAPI {
  int status;
  List<Markets> markets;
  Products products;
  CouintAPI({this.status, this.markets, this.products});
  CouintAPI.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['markets'] != null) {
      markets = new List<Markets>();
      json['markets'].forEach((v) {
        markets.add(new Markets.fromJson(v));
      });
    }
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
  }

  @override
  String toString() {
    return '{${this.status},${this.markets},${this.products} }';
  }
}