class CircleModel {
  int code;
  String msg;
  List<CircleData> data;
  bool success;

  CircleModel({this.code, this.msg, this.data, this.success});

  CircleModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<CircleData>();
      json['data'].forEach((v) {
        data.add(new CircleData.fromJson(v));
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

class CircleData {
  int id;
  String userId;
  int userType;
  String content;
  String image1;
  Null image2;
  Null image3;
  String phoneNumber;

  CircleData(
      {this.id,
        this.userId,
        this.userType,
        this.content,
        this.image1,
        this.image2,
        this.image3,
        this.phoneNumber});

  CircleData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    userType = json['userType'];
    content = json['content'];
    image1 = json['image1'];
    image2 = json['image2'];
    image3 = json['image3'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['userType'] = this.userType;
    data['content'] = this.content;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['image3'] = this.image3;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}