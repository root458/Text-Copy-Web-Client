import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnon() async {
    try {
      UserCredential userCred = await _auth.signInAnonymously();
      return userCred.user;
    } catch (e) {
      // Do nothing
    }
  }
}

class Database {
  // Texts collection
  final CollectionReference textsCollection =
      FirebaseFirestore.instance.collection('texts_collection');

  // Fetch function
  Stream<List<CopiedText>> get copiedTexts {
    return textsCollection.snapshots().map(_copiedTextsListFromSnaphot);
  }

  List<CopiedText> _copiedTextsListFromSnaphot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return CopiedText(dateTime: DateTime.parse(doc.get('date')), text: doc.get('text'));
    }).toList();
  }
}

class CopiedText {
  final String text;
  final DateTime dateTime;

  CopiedText({required this.dateTime, required this.text});
}
