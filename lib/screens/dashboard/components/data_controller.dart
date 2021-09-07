import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  //odoohndoo iim ym hiij bga
  Future queryData(String queryString) async {
    return FirebaseFirestore.instance
        .collection('profile')
        // .where('displayName', isGreaterThanOrEqualTo: queryString)
        .where('username', isGreaterThanOrEqualTo: "@" + queryString)
        .limit(20)
        .get();
  }
}
