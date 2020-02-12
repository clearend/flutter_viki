import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/httpHeaders.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../routers/application.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  String homePageContent = '正在获取数据';
  int page = 1;
  List<Map> hotGoodsList = [];
  GlobalKey<RefreshFooterState> _footerkey = new GlobalKey<RefreshFooterState>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('viki'),),
      body: FutureBuilder(
        future: request('getCategoryInfo',formData: null),
        builder: (context,snapshot){
          if(snapshot.hasData){
            //print('===============');
            //print(snapshot.data);
            var data =snapshot.data; //json.decode(snapshot.data.toString());
            List<Map> swiper = (data['data'] as List).cast();
            List<Map> navigatorList = (data['data'] as List).cast();
            String adPicture = swiper[0]['imageUrl'];
            List<Map> recommendList = (data['data'] as List).cast();

            return EasyRefresh(
              refreshFooter: ClassicsFooter(
                key: _footerkey,
                bgColor: Colors.white,
                textColor: Colors.yellow,
                moreInfoColor: Colors.yellow,
                showMore: true,
                noMoreText: '',
                moreInfo: '加载中',
                loadReadyText: '上拉加载...',
              ),

                child:ListView(
                  children: <Widget>[
                    SwiperDiy(swiperDataList: swiper),
                    TopNavigator(navigatorList: navigatorList,),
                    AdBanner(adPicture: adPicture,),
                    Recommend(recommendList: recommendList,),
                    _hotGoods(),
                  ],
                ),
              loadMore: ()async{
                  print('开始加载更多......');
                  var formData = {'page':page};
                  await request('homePageBelowContent',formData: formData).then((val){
                    List<Map> newGoodsList = (val['data'] as List).cast();
                    setState(() {
                      hotGoodsList.addAll(newGoodsList);
                      page++;
                    });
                  });
              },
            );
          }else {
                return Center(
                  child: Text('加载中。。。'),
                );
          }
        },
      ),
    );
  }


  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    padding: EdgeInsets.all(5.0),
    child: Text('火爆专区'),
  );

  Widget _wrapList(){
    if(hotGoodsList.length!=0){
      List<Widget> listWidget = hotGoodsList.map((val){
        return InkWell(
          onTap: (){
              Application.router.navigateTo(context, "/detail?id=${val['goodsId']}");

          },
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(val['imageUrl'],width: ScreenUtil().setWidth(370),),
                Text(
                  val['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.deepOrange,fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: <Widget>[
                    Text('￥${val['mallPrice']}'),
                    Text(
                      '￥${val['price']}',
                      style: TextStyle(color: Colors.black26,decoration: TextDecoration.lineThrough),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();

      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    }else {
      return Text('');
    }
  }

  Widget _hotGoods(){
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _wrapList()
        ],
      ),
    );
  }
}

//轮播图
class SwiperDiy extends StatelessWidget {

  final List swiperDataList;
  final List swiperDataList1 = ['http://121.36.0.188/scroller/1.jpg','http://121.36.0.188/scroller/2.jpg','http://121.36.0.188/scroller/3.jpg'];

  SwiperDiy({this.swiperDataList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network("${swiperDataList1[index]}",fit: BoxFit.fill,);
        },
        itemCount: swiperDataList1.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

//类别导航
class TopNavigator extends StatelessWidget {
  final List navigatorList;
  TopNavigator({Key key,this.navigatorList}) : super(key : key);

  Widget _gridViewItemUI(BuildContext context,item){
    return InkWell(
      onTap: (){
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          Image.network(item['imageUrl'],width: ScreenUtil().setWidth(95),),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children:navigatorList.map((item){
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}

//广告
class AdBanner extends StatelessWidget {
  final String adPicture ;

  AdBanner({Key key ,this.adPicture}) : super(key:key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network('http://121.36.0.188/advertise.jpg'),
    );
  }
}

//商品推荐
class Recommend extends StatelessWidget {
  final List recommendList;

  Recommend({Key key,this.recommendList}) : super(key:key);

  //标题方法
  Widget _titleWidget(){
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(width: 0.5,color: Colors.black12)
      )
    ),
    child: Text(
      '商品推荐',
      style: TextStyle(color: Colors.yellow),
    ),
  );
}

  //商品单独项方法
  Widget _item(index){
    return InkWell(
      onTap: (){},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5,color: Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['imageUrl']),
            Text('￥12.99'),
            Text(
                '￥20',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey
              ),
            )

          ],
        ),
      ),
    );
  }

  //横向列表方法
  Widget _recommendList(){
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context,index){
          return _item(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommendList()
        ],
      ),
    );
  }
}

