class CouponModel {
  final String title;
  final int point;
  final String imageUrl;

  const CouponModel({required this.title, required this.point, required this.imageUrl});

  static const List<CouponModel> couponList = [
    CouponModel(
        point: 15, title: "Bim", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/3/30/Logo_of_B%C4%B0M.PNG"),
    CouponModel(
        point: 35,
        title: "Defacto",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnt9C2F72nstwzLDqWQywhrFn5x3DIU74DaMRx07ZYT7PRt5w9GCqwnxnUvauXMbxSwG4&usqp=CAU"),
    CouponModel(
        point: 50,
        title: "Nike",
        imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Logo_NIKE.svg/1200px-Logo_NIKE.svg.png"),
    CouponModel(
        point: 100, title: "Adidas", imageUrl: "https://logos-world.net/wp-content/uploads/2020/04/Adidas-Symbol.png"),
  ];
}

class ArticleModel {
  final String title;
  final String imageUrl;

  const ArticleModel({required this.title, required this.imageUrl});

  static const List<ArticleModel> articleList = [
    ArticleModel(
      imageUrl:
          "https://www.canakkaletv.com.tr/images/haberler/2020/02/75-bin-kg-bitkisel-atik-yag-toplandi.jpg",
      title: "Atık Yağlar",
    ),
    ArticleModel(
      title: "Plastik atıklar nelerdir",
      imageUrl:
          "https://im.haberturk.com/2019/11/06/ver1573036463/2537909_810x458.jpg",
    ),
    ArticleModel(
      title: "Pillerin zararları",
      imageUrl:
          "https://trthaberstatic.cdn.wp.trt.com.tr/resimler/576000/577852.jpg",
    ),
    ArticleModel(
      title: "Neden dönüşüm yapmalıyız?",
      imageUrl:
          "https://www.elektrikde.com/wp-content/uploads/2020/12/Geri-Donusum-Nedir.jpg",
    ),
  ];
}
