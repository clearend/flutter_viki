import 'package:flutter/material.dart';
import '../model/circle.dart';
import '../service/service_method.dart';
import 'dart:convert';

class CircleInfoProvide with ChangeNotifier {
  CircleModel circleModel;

  //从后台获取商品数据
  getCircleInfo() async {
    await request('getCircle',formData: {'page':1}).then((val) {
      print(val);
      circleModel = CircleModel.fromJson(val);
      notifyListeners();
    });
  }
}