import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_app/core/services/database_service.dart';

class FirestoreServices implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  // this method is used to get data  Specified by the path and the documentId

  // Future<Map<String, dynamic>> getData(
  //     {required String path, required String documentId}) async {
  //   var data = await firestore.collection(path).doc(documentId).get();
  //   return data.data() as Map<String, dynamic>;
  // }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  // @override
  // Future<dynamic> getData(
  //     {required String path,
  //     String? documentId,
  //     Map<String, dynamic>? quiry}) async {
  //   if (documentId != null) {
  //     var data = await firestore.collection(path).doc(documentId).get();
  //     return data.data();
  //   } else {
  //     var data = await firestore.collection(path).get();
  //     return data.docs.map((e) => e.data()).toList();
  //   }
  // }
  @override
  Future<dynamic> getData(
      {required String path,
      String? docuementId,
      Map<String, dynamic>? query}) async {
    if (docuementId != null) {
      var data = await firestore.collection(path).doc(docuementId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }
}
