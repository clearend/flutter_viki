import 'dart:developer';

import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/child_category.dart';
import './provide/category_goods_list.dart';
import 'package:fluro/fluro.dart';
import './routers/routers.dart';
import './routers/application.dart';
import './provide/details_info.dart';
import './provide/cart.dart';
import './provide/circle_info.dart';

void main() {
  var childCategory = ChildCategory();
  var providers = Providers();
  var cartProvide = CartProvide();
  var circleInfoProvide = CircleInfoProvide();
  var categoryGoodsListProvide = CategoryGoodsListProvide();
  var detailsInfoProvide  = DetailsInfoProvide();

  providers
  ..provide(Provider<ChildCategory>.value(childCategory))
  ..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide))
  ..provide(Provider<CartProvide>.value(cartProvide))
  ..provide(Provider<CircleInfoProvide>.value(circleInfoProvide))
  ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide));

  runApp(ProviderNode(child: MyApp(),providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final router  = Router();
    Routes.configureRoutes(router);
      Application.router = router;


    return Container(
      child: MaterialApp(
        title: 'ViKi',
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.yellow
        ),
        home: IndexPage(),
      ),
    );
  }
}
