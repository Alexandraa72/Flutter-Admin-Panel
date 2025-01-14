import 'package:admin/models/RecentFile.dart';
import 'package:admin/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key key,
  }) : super(key: key);
  Stream<QuerySnapshot> getMessageConvo(
          {String reciveruserId, String senderuserId}) =>
      FirebaseFirestore.instance
          .collection("profile")
          .limit(10)
          .orderBy("wallet", descending: true)
          .snapshots(includeMetadataChanges: true);
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
            "Нийт Хэрэглэгч",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: StreamBuilder(
                stream: getMessageConvo(),
                builder: (context, snapshot) {
                  // print("IRSN DATA:" + snapshot.data[2]["displayName"]);
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    // print("IRSN DATA" + snapshot.data.docs[2].toString());
                    // UserModel.fromJson(snapshot.data());
                    return DataTable2(
                      columnSpacing: 50,
                      minWidth: 1000,
                      columns: [
                        DataColumn(
                          label: Text("displayName"),
                        ),
                        DataColumn(
                          label: Text("wallet"),
                        ),
                        DataColumn(
                          label: Text("createdAt"),
                        ),
                        DataColumn(
                          label: Text("Дэлгэрэнгүй"),
                        ),
                        DataColumn(
                          label: Text("Гүйлгээний түүх"),
                        ),
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
  UserModel fileInfo = UserModel.fromJson(snapshot.data());
  return DataRow(
    cells: [
      DataCell(
        Container(
          width: 200,
          child: Text(
            fileInfo.displayName,
            overflow: TextOverflow.clip,
          ),
        ),
      ),
      DataCell(Text(fileInfo.wallet)),
      DataCell(Text(fileInfo.createdAt)),
      DataCell(
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.cyanAccent.withOpacity(.2),
            border: Border.all(color: Colors.cyanAccent),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: TextButton(
            onPressed: () {},
            child: Text("Дэлгэрэнгүй"),
          ),
        ),
      ),
      DataCell(
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.indigoAccent.withOpacity(.2),
            border: Border.all(color: Colors.indigoAccent),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: TextButton(
            onPressed: () {},
            child: Text("Гүйлгээ"),
          ),
        ),
      ),
    ],
  );
}
