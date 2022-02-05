import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataHandler {
  DataHandler._();

  static final DataHandler dataInstance = DataHandler._();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future createUser() async {
    try {
      await firestore.collection('User').doc(auth.currentUser?.uid).set(
        {
          'name': auth.currentUser?.displayName,
          'email': auth.currentUser?.email,
          'image': auth.currentUser?.photoURL,
          'timestamp': Timestamp.now(),
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future updateUserCity(String city) async {
    try {
      await firestore.collection('User').doc(auth.currentUser?.uid).set(
        {
          'city': city,
          // 'isActive': true,
          'timestamp': Timestamp.now(),
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
