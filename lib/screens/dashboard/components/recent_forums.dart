import 'package:admin/models/recent_user_model.dart';
import 'package:admin/utils/colorful_tag.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class RecentDiscussions extends StatelessWidget {
  const RecentDiscussions({
    Key key,
  }) : super(key: key);

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
            "Recent Open Positions",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              showCheckboxColumn: true,
              columns: [
                DataColumn(
                  label: Text("Position Name"),
                ),
                DataColumn(
                  label: Text("Create Date"),
                ),
                DataColumn(
                  label: Text("Total Application"),
                ),
              ],
              rows: List.generate(
                recentUsers.length,
                (index) => recentUserDataRow(recentUsers[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentUserDataRow(RecentUser userInfo) {
  return DataRow(
    cells: [
      DataCell(Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: getRoleColor(userInfo.role).withOpacity(.2),
            border: Border.all(color: getRoleColor(userInfo.role)),
            borderRadius: BorderRadius.all(Radius.circular(5.0) //
                ),
          ),
          child: Text(userInfo.role))),
      DataCell(Text(userInfo.date)),
      DataCell(Text(userInfo.posts)),
    ],
  );
}
