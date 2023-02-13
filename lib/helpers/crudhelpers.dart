import 'package:cloud_firestore/cloud_firestore.dart';
import '../data_models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Contact');

class CrudHelpers {
  static Future<Response> addContact({
    required String contactname,
    required String contactmail,
    required String contactnumber,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "contact_name": contactname,
      "e-mail": contactmail,
      "phone": contactnumber
    };

    var result = await documentReferencer.set(data).whenComplete(() {
      response.code = 200;
      response.msg = "Successfully added new Contacts";
    }).catchError((e) {
      response.code = 500;
      response.msg = e;
    });

    return response;
  }

  static Future<Response> updateContact({
    required String contactname,
    required String contactmail,
    required String contactnumber,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "contact_name": contactname,
      "e-mail": contactmail,
      "phone": contactnumber
    };

    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.msg = "Sucessfully updated the contact";
    }).catchError((e) {
      response.code = 500;
      response.msg = e;
    });

    return response;
  }

  static Stream<QuerySnapshot> readContact() {
    CollectionReference notesItemCollection = _Collection;

    return notesItemCollection.snapshots();
  }

  static Future<Response> deleteContact({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    await documentReferencer.delete().whenComplete(() {
      response.code = 200;
      response.msg = "Sucessfully deleted the contacts";
    }).catchError((e) {
      response.code = 500;
      response.msg = e;
    });

    return response;
  }
}
