abstract class DataBaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});
  Future<dynamic> getData({
    required String path,
    // if i want to get data specified
    
    //  => required String documentId,
    //Map<String, dynamic>

    String? documentId,
  });

  Future<bool> checkIfDataExists(
      {required String path, required String documentId});
}
