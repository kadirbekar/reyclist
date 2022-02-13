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
        itemCount: 10,
        itemBuilder: (context, index) {
          return const transactionsPage();
        });
  }

  AppBar get appBar => AppBar(
        title: const Text("Geri Dönüşüm Geçmişim"),
      );
}

class transactionsPage extends StatelessWidget {
  const transactionsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingListTile.all(),
      child: Card(
        child: ListTile(
          leading: const CircleAvatar(),
          title: recyclingCenterName,
          subtitle: recyclingDate,
          trailing: const Icon(
            Icons.recycling_outlined,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Text get recyclingDate => const Text(
        "Subtitle",
        style: bodyStyle,
      );

  Text get recyclingCenterName => const Text(
        "name",
        style: heading3Style,
      );
}
