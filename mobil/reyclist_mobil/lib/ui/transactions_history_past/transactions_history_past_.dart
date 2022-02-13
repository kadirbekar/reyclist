import 'package:flutter/material.dart';
import 'package:reyclist_mobil/core/constants/padding_constants.dart';
import 'package:reyclist_mobil/core/init/design/text_style.dart';

class TransactionsPast extends StatefulWidget {
  const TransactionsPast({Key? key}) : super(key: key);

  @override
  _TransactionsPastState createState() => _TransactionsPastState();
}

class _TransactionsPastState extends State<TransactionsPast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: bodyListview(),
    );
  }

  ListView bodyListview() {
    return ListView.builder(
        itemCount: TransactionHistoryModel.transactionList.length,
        itemBuilder: (context, index) {
          return transactionsPage(
            model: TransactionHistoryModel.transactionList[index],
          );
        });
  }

  AppBar get appBar => AppBar(
        title: const Text("Geri Dönüşüm Geçmişim"),
      );
}

class transactionsPage extends StatelessWidget {
  const transactionsPage({Key? key, required this.model}) : super(key: key);

  final TransactionHistoryModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(radius: 36, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.abccevre.com/dosyalar/2017/11/battery-optimizer-icon.png"),
          )),
          title: recyclingDate(model.title),
          subtitle: recyclingCenterName(model.createdDate),
          trailing: const Icon(
            Icons.recycling_outlined,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Text recyclingDate(String title) => Text(
        title,
        style: subheadingStyle,
      );

  Text recyclingCenterName(String date) => Text(
        date,
        style: bodyStyle,
      );
}

class TransactionHistoryModel {
  final String title;
  final int point;
  final String createdDate;

  const TransactionHistoryModel({required this.title, required this.point, required this.createdDate});

  static const List<TransactionHistoryModel> transactionList = [
    TransactionHistoryModel(title: "1 kg kağıt bırakıldı", point: 25, createdDate: "2022-10-15 15:01"),
    TransactionHistoryModel(title: "1 kg kağıt bırakıldı", point: 25, createdDate: "2022-10-15 15:01"),
    TransactionHistoryModel(title: "1 kg kağıt bırakıldı", point: 25, createdDate: "2022-10-15 15:01"),
    TransactionHistoryModel(title: "1 kg kağıt bırakıldı", point: 25, createdDate: "2022-10-15 15:01"),
    TransactionHistoryModel(title: "1 kg kağıt bırakıldı", point: 25, createdDate: "2022-10-15 15:01"),
    TransactionHistoryModel(title: "1 kg kağıt bırakıldı", point: 25, createdDate: "2022-10-15 15:01"),
    TransactionHistoryModel(title: "1 kg kağıt bırakıldı", point: 25, createdDate: "2022-10-15 15:01"),
    TransactionHistoryModel(title: "1 kg kağıt bırakıldı", point: 25, createdDate: "2022-10-15 15:01"),
  ];
}
