import 'package:flutter/material.dart';
import '../model/category.dart';
import '../model/categoryGoodsList.dart';

class ChildCategory with ChangeNotifier{
  List<GoodsList> childCategoryList = [];
  int childIndex = 0;     //子类高亮索引
  int categoryId = 1;     //大类默认id
  int subId = 1;        //小类id
  int page = 1 ;      //列表页页数
  String noMoreText = '';   //显示没有数据的文字

  //大类切换逻辑
  getChildCategory(List<GoodsList> list,int id){

    page = 1;
    noMoreText = '';
    childIndex = 0;
    categoryId = id;
    GoodsList all = GoodsList();
    all.imageUrl=1;
    all.mallCategoryId=1;
    all.comments = null;
    all.mallSubName = '推荐';
    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }

  //改变子类索引
  changeChildIndex(index,int id){
    page = 1;
    noMoreText = '';
    childIndex = index;
    subId = id;
    notifyListeners();
  }

  //增加page的方法；
  addPage(){
    page++;
  }

  changeNoMore(String text){
    noMoreText = text;
    notifyListeners();
  }
}