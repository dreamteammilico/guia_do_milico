import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guia_do_milico/modules/security/models/user.dart';

class UserRepository {
  final db = FirebaseFirestore.instance;

  Future<List<User>> getAllUsers() async {
    var usersCollection = db.collection('users').withConverter(
          fromFirestore: User.fromFirestore,
          toFirestore: (User user, _) => user.toFirestore(),
        );

    usersCollection.get().then(
      (querySnapshot) {
        print("Successfully completed");
        return querySnapshot.docs.map((e) => e.data());
      },
      onError: (e) => print("Error completing: $e"),
    );
    return List.empty();
  }

  Future<void> setUser(User user) async {
    db
        .collection('users')
        .withConverter(
            fromFirestore: User.fromFirestore,
            toFirestore: (User user, _) => user.toFirestore())
        .doc(user.uid)
        .set(user);
  }

  Future<User?> getUserByUid(String uid) async {
    var future = await db
        .collection('users')
        .withConverter(
            fromFirestore: User.fromFirestore,
            toFirestore: (User user, _) => user.toFirestore())
        .doc(uid)
        .get();
    return future.data();
  }
}
