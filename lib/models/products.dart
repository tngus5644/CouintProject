import 'dart:async';
import 'dart:convert';
import 'markets.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<Products> fetchProducts(http.Client client) async {
  final response = await client.get('https://couint.com/api/products');
  return compute(parseProducts, response.body);
}

Products parseProducts(String responseBody) {
  final mparsed = jsonDecode(responseBody)['products'];
  Products products = Products.fromJson(mparsed);
  return products;
}

class Data {
  int id;
  int market_id;
  String name;
  String image;
  int price;
  String introduction;
  String long_introduction;
  String created_at;
  String updated_at;
  int is_ready;
  Markets market;

  Data(
      this.id,
      this.market_id,
      this.name,
      this.image,
      this.price,
      this.introduction,
      this.long_introduction,
      this.created_at,
      this.updated_at,
      this.is_ready,
      this.market);

  factory Data.fromJson(Map<String, dynamic> json) {
    Markets markets;
    markets =  Markets.fromJson(json['market']);

      return Data(
          json['id'] as int,
          json['market_id'] as int,
          json['name'] as String,
          json['image'] as String,
          json['price'] as int,
          json['introduction'] as String,
          json['long_introduction'] as String,
          json['created_at'] as String,
          json['updated_at'] as String,
          json['is_ready'] as int,
          markets
      );
    }
  @override
  String toString() {
    return '{ ${this.id}, ${this.market_id}, ${this.name}, ${this.image},${this.price},${this.introduction},${this.long_introduction},${this.created_at},${this.updated_at},${this.is_ready} }';
  }
  String getPrice({double myPrice}) {
    if (myPrice != null) {
      return '\$${myPrice.toStringAsFixed(2)}';
    }
    return '\$${this.price.toStringAsFixed(2)}';
  }
}

class Products {
  int current_page;
  String first_page_url;
  int from;
  int last_page;
  String last_page_url;
  String next_page_url;
  String path;
  int per_page;
  String prev_page_url;
  int to;
  int total;
  List<Data> data;

  Products({
      this.current_page,
      this.first_page_url,
      this.from,
      this.last_page,
      this.last_page_url,
      this.next_page_url,
      this.path,
      this.per_page,
      this.prev_page_url,
      this.to,
      this.total,
      this.data});

  factory Products.fromJson(dynamic json) {
    if (json['data'] != null) {
      List<Data> data = json['data'].map<Data>((i) => Data.fromJson(i)).toList();
      return Products(
          current_page : json['current_page'] as int,
          first_page_url:  json['first_page_url'] as String,
          from: json['from'] as int,
          last_page: json['last_page'] as int,
          last_page_url: json['last_page_url'] as String,
          next_page_url:  json['next_page_url'] as String,
          path:  json['path'] as String,
          per_page: json['per_page'] as int,
          prev_page_url : json['prev_page_url'] as String,
          to: json['to'] as int,
          total: json['total'] as int,
          data: data);
    } else {
      return Products(
        current_page : json['current_page'] as int,
        first_page_url:  json['first_page_url'] as String,
        from: json['from'] as int,
        last_page: json['last_page'] as int,
        last_page_url: json['last_page_url'] as String,
        next_page_url:  json['next_page_url'] as String,
        path:  json['path'] as String,
        per_page: json['per_page'] as int,
        prev_page_url : json['prev_page_url'] as String,
        to: json['to'] as int,
        total: json['total'] as int,
      );
    }
  }

  @override
  String toString() {
    return '{ ${this.current_page}, ${this.first_page_url}, ${this.from}, ${this.last_page},${this.last_page_url},${this.next_page_url},${this.path},${this.per_page},${this.prev_page_url},${this.to},${this.total} }';
  }
}