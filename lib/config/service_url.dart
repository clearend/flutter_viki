const serviceUrl = 'http://123.56.25.104:8081/Viki/user/';//'http://123.56.25.104:8081/Viki/user/';
const servicePath = {
  'getScrollerImage' : serviceUrl + 'getScrollerImage',  //获取轮播图
  'getCategoryInfo' : serviceUrl + 'getCategoryInfo' ,   //获取类别
  'homePageBelowContent' : serviceUrl + 'homePageBelowContent',   //商城首页热卖商品
  'getCategory' : serviceUrl + 'getCategory',           //获取商品类别信息
  'getGoods' : serviceUrl + 'getGoods', //商品分类的商品列表
  'getGoodsDetailById' :serviceUrl + 'getGoodsDetailById',  //商品详细信息
  'getCircle' : serviceUrl + 'getCircle'              //获得买卖圈
};