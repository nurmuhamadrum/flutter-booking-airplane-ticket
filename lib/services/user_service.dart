import 'package:airplane/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final CollectionReference _userReference = FirebaseFirestore.instance
      .collection('users');

  // set data user to firestore firebase
  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hoby': user.hoby,
        'balance': user.balance,
      });
    } catch (e) {
      rethrow;
    }
  }
}
