class CategoryModel {
  List<Data> data;

  CategoryModel({this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int mallCategoryId;
  String mallCategoryName;
  Null comments;
  String imageUrl;
  List<GoodsList> goodsList;

  Data(
      {this.mallCategoryId,
        this.mallCategoryName,
        this.comments,
        this.imageUrl,
        this.goodsList});

  Data.fromJson(Map<String, dynamic> json) {
    mallCategoryId = json['mallCategoryId'];
    mallCategoryName = json['mallCategoryName'];
    comments = json['comments'];
    imageUrl = json['imageUrl'];
    if (json['goodsList'] != null) {
      goodsList = new List<GoodsList>();
      json['goodsList'].forEach((v) {
        goodsList.add(new GoodsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallCategoryName'] = this.mallCategoryName;
    data['comments'] = this.comments;
    data['imageUrl'] = this.imageUrl;
    if (this.goodsList != null) {
      data['goodsList'] = this.goodsList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GoodsList {
  String mallSubId;
  int mallCategoryId;
  String mallSubName;
  Null comments;
  int cid;
  int pid;
  int imageUrl;

  GoodsList(
      {
        this.mallSubId,
        this.mallCategoryId,
        this.mallSubName,
        this.comments,
        this.cid,
        this.pid,
        this.imageUrl});

  GoodsList.fromJson(Map<String, dynamic> json) {
    mallSubId = json['mallSubId'];
    mallCategoryId = json['mallCategoryId'];
    mallSubName = json['mallSubName'];
    comments = json['comments'];
    cid = json['cid'];
    pid = json['pid'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallSubId'] = this.mallSubId;
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallSubName'] = this.mallSubName;
    data['comments'] = this.comments;
    data['cid'] = this.cid;
    data['pid'] = this.pid;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}