import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo;
  bool isLeft = true;
  bool isRight = false;

  //从后台获取商品数据
  getGoodsInfo(String id) async {
    var formData = {'goodsId': id};
    await request('getGoodsDetailById', formData: formData).then((val) {
      print(val);
      goodsInfo = DetailsModel.fromJson(val);
      notifyListeners();
    });
  }

  //改变tabBar的状态
  changeLeftAndRight(String changeState) {
    if (changeState == 'left') {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }
}