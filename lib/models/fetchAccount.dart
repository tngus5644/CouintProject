import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:couintproject/screens/home.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'markets.dart';
import 'products.dart';

Future<MyAccount> fetchAPI(http.Client client) async {
  final response = await client.get('https://couint.com/api/myaccounts', headers: {HttpHeaders.authorizationHeader: 'Bearer '+Home.token});
  return compute(parseAPI, response.body);
}

MyAccount parseAPI(String responseBody) {
  final parsed = jsonDecode(responseBody);
  MyAccount myAccount = MyAccount.fromJson(parsed);

  return myAccount;
}

class MyAccount {
  int status;
  String message;
  List<Data> data;

  MyAccount({this.status, this.message, this.data});

  MyAccount.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  int userId;
  int obTokenId;
  String fintechUseNum;
  String accountAlias;
  String bankCodeStd;
  String bankCodeSub;
  String bankName;
  String accountNumMasked;
  String accountHolderName;
  String accountType;
  String inquiryAgreeYn;
  String inquiryAgreeDtime;
  String transferAgreeYn;
  String transferAgreeDtime;
  String payerNum;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
      this.userId,
      this.obTokenId,
      this.fintechUseNum,
      this.accountAlias,
      this.bankCodeStd,
      this.bankCodeSub,
      this.bankName,
      this.accountNumMasked,
      this.accountHolderName,
      this.accountType,
      this.inquiryAgreeYn,
      this.inquiryAgreeDtime,
      this.transferAgreeYn,
      this.transferAgreeDtime,
      this.payerNum,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    obTokenId = json['ob_token_id'];
    fintechUseNum = json['fintech_use_num'];
    accountAlias = json['account_alias'];
    bankCodeStd = json['bank_code_std'];
    bankCodeSub = json['bank_code_sub'];
    bankName = json['bank_name'];
    accountNumMasked = json['account_num_masked'];
    accountHolderName = json['account_holder_name'];
    accountType = json['account_type'];
    inquiryAgreeYn = json['inquiry_agree_yn'];
    inquiryAgreeDtime = json['inquiry_agree_dtime'];
    transferAgreeYn = json['transfer_agree_yn'];
    transferAgreeDtime = json['transfer_agree_dtime'];
    payerNum = json['payer_num'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['ob_token_id'] = this.obTokenId;
    data['fintech_use_num'] = this.fintechUseNum;
    data['account_alias'] = this.accountAlias;
    data['bank_code_std'] = this.bankCodeStd;
    data['bank_code_sub'] = this.bankCodeSub;
    data['bank_name'] = this.bankName;
    data['account_num_masked'] = this.accountNumMasked;
    data['account_holder_name'] = this.accountHolderName;
    data['account_type'] = this.accountType;
    data['inquiry_agree_yn'] = this.inquiryAgreeYn;
    data['inquiry_agree_dtime'] = this.inquiryAgreeDtime;
    data['transfer_agree_yn'] = this.transferAgreeYn;
    data['transfer_agree_dtime'] = this.transferAgreeDtime;
    data['payer_num'] = this.payerNum;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
