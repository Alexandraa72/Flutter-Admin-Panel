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
          .limit(100)
          .orderBy("wallet", descending: true)
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
            "Recent Files",
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
                      columnSpacing: defaultPadding,
                      minWidth: 800,
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
        Row(
          children: [
            Image.network(
              fileInfo.profilePic,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.displayName),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.wallet)),
      DataCell(Text(fileInfo.createdAt)),
    ],
  );
}
