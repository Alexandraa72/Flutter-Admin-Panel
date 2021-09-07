import 'package:admin/models/RecentFile.dart';
import 'package:admin/models/TransactionModel.dart';
import 'package:admin/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class RecentTransaction extends StatelessWidget {
  const RecentTransaction({
    Key key,
  }) : super(key: key);
  Stream<QuerySnapshot> getLastTransaction(
          {String reciveruserId, String senderuserId}) =>
      FirebaseFirestore.instance
          .collection("AllTransaction")
          .limit(10)
          .orderBy("date", descending: true)
          .snapshots();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Сүүлд хийсэн бүх гүйлгээ",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: StreamBuilder(
                stream: getLastTransaction(),
                builder: (context, snapshot) {
                  // print("IRSN DATA:" + snapshot.data[2]["displayName"]);
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    // print("IRSN DATA" + snapshot.data.docs[2].toString());
                    // UserModel.fromJson(snapshot.data());
                    return DataTable2(
                      // dataTextStyle: TextStyle(
                      //     fontStyle: FontStyle.italic, color: Colors.white),
                      showCheckboxColumn: false,
                      columnSpacing: 20,
                      minWidth: 800,
                      columns: [
                        DataColumn(
                          label: Text("From"),
                        ),
                        DataColumn(label: Text("To")),
                        DataColumn(
                            label: Text("Amount"),
                            numeric: true,
                            tooltip: "10"),
                        DataColumn(
                          label: Text("date"),
                        ),
                        DataColumn(
                            label: Text("transactionType"), tooltip: "1"),
                      ],
                      rows: List.generate(
                        snapshot.data.docs.length,
                        (index) => recentFileDataRow(snapshot.data.docs[index]),
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(DocumentSnapshot snapshot) {
  TransactionModel fileInfo = TransactionModel.fromJson(snapshot.data());
  return DataRow(
    cells: [
      DataCell(
        Text(
          fileInfo.fromUid,
          overflow: TextOverflow.clip,
        ),
        onTap: () {},
      ),
      DataCell(
          Text(
            fileInfo.toUid,
            overflow: TextOverflow.clip,
          ),
          onTap: () {}),
      DataCell(Container(
          width: 50, child: SelectableText(fileInfo.amount.toString()))),
      DataCell(SelectableText(DateTime.fromMillisecondsSinceEpoch(
              int.parse(fileInfo.date),
              isUtc: false)
          .toString())),
      DataCell(Container(
          width: 100, child: SelectableText(fileInfo.transactionType))),
    ],
  );
}
