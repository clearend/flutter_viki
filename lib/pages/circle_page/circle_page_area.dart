import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../provide/circle_info.dart';
import 'package:provide/provide.dart';


class CirclePageArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<CircleInfoProvide>(
      builder: (context,child,val){
        var circleInfo=Provide.value<CircleInfoProvide>(context).circleModel.data;
        if(circleInfo != null){
          return Container(
            color: Colors.white,
            padding: EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                _text(circleInfo[0].userId,circleInfo[0].userType),
                _goodsImage(circleInfo[0].image1),
                _phoneNumber(circleInfo[0].phoneNumber),
                _goodsName(circleInfo[0].content),
                _icon(),
                _text(circleInfo[1].userId,circleInfo[1].userType),
                _goodsImage(circleInfo[1].image1),
                _phoneNumber(circleInfo[1].phoneNumber),
                _goodsName(circleInfo[1].content),
                _icon(),
              ],
            ),
          );
        }else{
          return Text('暂无数据');
        }
      },
    );
  }

  Widget _userType(userType){
    String userTypeName ;
    if(userType == 0){
      userTypeName = '买家';
    }else{
      userTypeName = '卖家';
    }
      return Container(
        width: ScreenUtil().setWidth(730),
        padding: EdgeInsets.only(left: 15.0),
        child: Text(
            userTypeName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(60),
            color: Colors.red
          ),
        ),
      );
  }

  //商品图片
  Widget _goodsImage(url){
    return  Container(
      padding: EdgeInsets.all(15.0),
      child: Image.network(
        url,
        width:ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(750),
        fit: BoxFit.cover,
      ),
    );
  }

  //商品名称
  Widget _goodsName(name){

    return Container(

      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left:15.0),
      child: Text(
        '详情：${name}',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(30)
        ),
      ),
    );
  }
  
  Widget _phoneNumber(number){
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        '联系方式：${number}',
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
          decoration: TextDecoration.underline,
          color: Colors.yellow
        ),
      ),
    );
  }

  Widget _text(userId,userType){
    String userTypeName ;
    if(userType == 0){
      userTypeName = '买家';
    }else{
      userTypeName = '卖家';
    }
      return Container(
        margin: EdgeInsets.only(top: 15.0,right: 15.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                  Text(
                    '用户名：',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(30),
                        decoration: TextDecoration.underline,
                        color: Colors.deepOrange
                    ),
                  ),
                Text(
                  '${userId}    ',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                      color: Colors.black
                  ),
                ),
                Text(
                  '用户类型：',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                      decoration: TextDecoration.underline,
                      color: Colors.deepOrange
                  ),
                ),
                Text(
                  '${userTypeName}',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                      color: Colors.black
                  ),
                ),
              ],
            )
          ],
        ),
      );
  }

  Widget _icon(){
    return Container(
      padding: EdgeInsets.only(right: 40),
      child:Column(
          children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  color: Colors.orange,
                ),
                splashColor: Colors.red,
                onPressed:(){} ,
                ),
              Text(
                '  '
              ),
              Icon(Icons.message,color: Colors.orange),
            ],
          ),
        ]
      ),
    );
  }
}
