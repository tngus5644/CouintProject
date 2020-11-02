import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<MarketList> fetchMarkets(http.Client client) async {
  final response = await client.get('https://couint.com/api/products');
  return compute(parseMarkets,response.body);
}

MarketList parseMarkets(String responseBody) {
  final mparsed = jsonDecode(responseBody)['markets'];
  MarketList marketList = MarketList.fromJson(mparsed);
  return marketList;
}



//id, user_id, name, symbol, image, address, address_link, coin_price, introduction, created_at, updated_at
class Markets {
  final int id;
  final int user_id;
  final String name;
  final String symbol;
  final String image;
  final String address;
  final String address_link;
  final String coin_price;
  final String introduction;
  final String created_at;
  final String updated_at;
   bool selected;

  Markets(
      {this.id,
        this.user_id,
        this.name,
        this.symbol,
        this.image,
        this.address_link,
        this.address,
        this.coin_price,
        this.introduction,
        this.created_at,
        this.updated_at,
        this.selected});

  factory Markets.fromJson(Map<String, dynamic> json) {
    return Markets(
        id: json['id'] as int,
        user_id: json['id'] as int,
        name: json['name'] as String,
        symbol: json['symbol'] as String,
        image: json['image'] as String,
        address: json['address'] as String,
        address_link: json['address_link'] as String,
        coin_price: json['coin_price'] as String,
        introduction: json['introduction'] as String,
        created_at: json['created_at'] as String,
        updated_at: json['updated_at'] as String,
        selected : false);
  }

}

class MarketList{
  final List<Markets> markets;
  MarketList({this.markets});

  factory MarketList.fromJson(List<dynamic> json){
    List<Markets> markets = new List<Markets>();
    markets = json.map<Markets>((i) => Markets.fromJson(i)).toList();
    markets[0].selected = true;
    return new MarketList(markets: markets);
  }

  // selectById(int id) {
  //   this.markets.forEach((Markets markets) {
  //     markets.selected = false;
  //     if (markets.id == id) {
  //       markets.selected = true;
  //     }
  //   });
  // }
}

void selectById(List<Markets> markets, int id) {
  markets.forEach((Markets markets) {
    markets.selected = false;
    if (markets.id == id) {
      markets.selected = true;
    }
  });
}
int selectedId(List<Markets> markets, int id) {
  markets.forEach((Markets markets) {
    if (markets.id == id) {
      return markets.id;
    }
  });
}