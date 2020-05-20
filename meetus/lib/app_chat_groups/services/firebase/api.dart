import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Api {
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  Api(this.path) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }

  Future<void> removeDocument(String id) {
    return ref.document(id).delete();
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  Future<void> updateDocument(Map data, String id) {
    return ref.document(id).updateData(data);
  }

  Future<void> addUserInGroup(Map data, String id) {
    return ref.document(id).collection("members").add(data);
  }

  Future<void> setData(String documentId, Map data) {
    return ref.document(documentId).setData(data);
  }

  Future<void> updateUserNewGroup(Map data, String id) {
//		List<Map> list=new List();
//
//		if(data !=null && data.isNotEmpty){
//			data.forEach((grp){
//				list.add(grp.toJson());
//			});
//		}

    return ref.document(id).collection("groups").add(data);
  }
}
