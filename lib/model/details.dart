class DetailsModel {
  int code;
  String msg;
  DetailsGoodsData data;
  bool success;

  DetailsModel({this.code, this.msg, this.data, this.success});

  DetailsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new DetailsGoodsData.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class DetailsGoodsData {
  GoodsInfo goodsInfo;
  List<GoodsComments> goodsComments;
  AdvertesPicture advertesPicture;

  DetailsGoodsData({this.goodsInfo, this.goodsComments, this.advertesPicture});

  DetailsGoodsData.fromJson(Map<String, dynamic> json) {
    goodsInfo = json['goodsInfo'] != null
        ? new GoodsInfo.fromJson(json['goodsInfo'])
        : null;
    if (json['goodsComments'] != null) {
      goodsComments = new List<GoodsComments>();
      json['goodsComments'].forEach((v) {
        goodsComments.add(new GoodsComments.fromJson(v));
      });
    }
    advertesPicture = json['advertesPicture'] != null
        ? new AdvertesPicture.fromJson(json['advertesPicture'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.goodsInfo != null) {
      data['goodsInfo'] = this.goodsInfo.toJson();
    }
    if (this.goodsComments != null) {
      data['goodsComments'] =
          this.goodsComments.map((v) => v.toJson()).toList();
    }
    if (this.advertesPicture != null) {
      data['advertesPicture'] = this.advertesPicture.toJson();
    }
    return data;
  }
}

class GoodsInfo {
  int id;
  String goodsId;
  String image1;
  Null image2;
  Null image3;
  Null image4;
  Null image5;
  int amount;
  String isOnline;
  int goodsSerialNumber;
  double oriPrice;
  double presentPrice;
  String comPic;
  int state;
  String shopId;
  String goodsName;
  String goodsDetail;

  GoodsInfo(
      {this.id,
        this.goodsId,
        this.image1,
        this.image2,
        this.image3,
        this.image4,
        this.image5,
        this.amount,
        this.isOnline,
        this.goodsSerialNumber,
        this.oriPrice,
        this.presentPrice,
        this.comPic,
        this.state,
        this.shopId,
        this.goodsName,
        this.goodsDetail});

  GoodsInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsId = json['goodsId'];
    image1 = json['image1'];
    image2 = json['image2'];
    image3 = json['image3'];
    image4 = json['image4'];
    image5 = json['image5'];
    amount = json['amount'];
    isOnline = json['isOnline'];
    goodsSerialNumber = json['goodsSerialNumber'];
    oriPrice = json['oriPrice'];
    presentPrice = json['presentPrice'];
    comPic = json['comPic'];
    state = json['state'];
    shopId = json['shopId'];
    goodsName = json['goodsName'];
    goodsDetail = json['goodsDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goodsId'] = this.goodsId;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['image3'] = this.image3;
    data['image4'] = this.image4;
    data['image5'] = this.image5;
    data['amount'] = this.amount;
    data['isOnline'] = this.isOnline;
    data['goodsSerialNumber'] = this.goodsSerialNumber;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['comPic'] = this.comPic;
    data['state'] = this.state;
    data['shopId'] = this.shopId;
    data['goodsName'] = this.goodsName;
    data['goodsDetail'] = this.goodsDetail;
    return data;
  }
}

class GoodsComments {
  int id;
  String goodsId;
  int score;
  String comments;
  String userName;
  int discussTime;

  GoodsComments(
      {this.id,
        this.goodsId,
        this.score,
        this.comments,
        this.userName,
        this.discussTime});

  GoodsComments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsId = json['goodsId'];
    score = json['score'];
    comments = json['comments'];
    userName = json['userName'];
    discussTime = json['discussTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goodsId'] = this.goodsId;
    data['score'] = this.score;
    data['comments'] = this.comments;
    data['userName'] = this.userName;
    data['discussTime'] = this.discussTime;
    return data;
  }
}

class AdvertesPicture {
  int id;
  String pictureAddress;
  int toPlace;

  AdvertesPicture({this.id, this.pictureAddress, this.toPlace});

  AdvertesPicture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pictureAddress = json['pictureAddress'];
    toPlace = json['toPlace'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pictureAddress'] = this.pictureAddress;
    data['toPlace'] = this.toPlace;
    return data;
  }
}