class CategoryGoodsListModel {
  int code;
  String msg;
  List<CategoryListData> data;
  bool success;

  CategoryGoodsListModel({this.code, this.msg, this.data, this.success});

  CategoryGoodsListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<CategoryListData>();
      json['data'].forEach((v) {
        data.add(new CategoryListData.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class CategoryListData {
  String goodsId;
  int id;
  double oriPrice;
  double presentPrice;
  String imageUrl;
  String goodsName;

  CategoryListData(
      {this.goodsId,
        this.id,
        this.oriPrice,
        this.presentPrice,
        this.imageUrl,
        this.goodsName});

  CategoryListData.fromJson(Map<String, dynamic> json) {
    goodsId = json['goodsId'];
    id = json['id'];
    oriPrice = json['oriPrice'];
    presentPrice = json['presentPrice'];
    imageUrl = json['imageUrl'];
    goodsName = json['goodsName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['id'] = this.id;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['imageUrl'] = this.imageUrl;
    data['goodsName'] = this.goodsName;
    return data;
  }
}