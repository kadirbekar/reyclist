import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:reyclist_mobil/core/models/coupon_modeld.dart';
import 'package:reyclist_mobil/ui/login/login_view_model/login_view_model.dart';
import 'package:reyclist_mobil/ui/transactions_history_past/transactions_history_past_.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final SizedBox sizedBox = const SizedBox(height: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://s3-ap-southeast-1.amazonaws.com/blog-sg/wp-content/uploads/2016/09/29153513/Business-lady-small.jpg"),
                    radius: 50,
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Foo Bar",
                        style: context.textTheme.headline5,
                      ),
                      sizedBox,
                      Text(
                        "Level-3   -   1330",
                        style: context.textTheme.subtitle1,
                      ),
                      sizedBox,
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                        child: const Text(
                          "Geri Dönüşüm Geçmişim",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          context.navigateToPage(const TransactionsPast());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Align(alignment: Alignment.centerLeft, child: _HeaderText(text: "Kupon")),
            ),
            _couponList(context),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Align(alignment: Alignment.centerLeft, child: _HeaderText(text: "Akademik Makaleler")),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                height: MediaQuery.of(context).size.height * 0.2,
                child: _articleList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _articleList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: ArticleModel.articleList.length,
      itemBuilder: (context, index) {
        final item = ArticleModel.articleList[index];
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Card(
            margin: const EdgeInsets.only(right: 10.0),
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  right: 0,
                  top: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(36),
                      child: Image.network(
                        item.imageUrl,
                        alignment: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    item.title,
                    style: context.textTheme.headline5,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _couponList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CouponModel.couponList.length,
        itemBuilder: (context, index) {
          final item = CouponModel.couponList[index];
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Card(
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    right: 0,
                    bottom: -15,
                    child: Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Image.network(
                        item.imageUrl,
                        alignment: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(item.title, style: context.textTheme.headline5),
                    subtitle: Text("${item.point}"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: context.textTheme.headline4?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
