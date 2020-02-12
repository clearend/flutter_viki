import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_viki/service/service_method.dart';
import 'package:provide/provide.dart';
import '../provide/circle_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './circle_page/circle_page_area.dart';

class CirclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('买卖圈'),),
        body: FutureBuilder(
          future: _getCircleInfo(context),
          builder: (context,snapshot){
           if(snapshot.hasData){
             return Stack(
               children: <Widget>[
                 Container(
                   child: ListView(
                     children: <Widget>[
                       CirclePageArea()
                     ],
                   ),
                 ),
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   child: CirclePageArea()
//                 )
               ],
             );
           }else{
             return Text('暂时无数据');
           }
          },
        ),
      );


  }
  Future _getCircleInfo(BuildContext context) async {
    await Provide.value<CircleInfoProvide>(context).getCircleInfo();
    return '完成加载';
  }

}
