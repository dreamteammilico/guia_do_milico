import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  late String uid;
  late String email;
  late String? photo;
  late String name;
  late String? surname;
  late String? phoneNumber;
  late bool? emailVerified;
  late String? storeToken;
  late String provider;
  late String createdAt;
  late String? lastLogin;

  User({
    required this.uid,
    required this.email,
    this.photo,
    required this.name,
    this.surname,
    this.emailVerified,
    this.phoneNumber,
    this.storeToken,
    required this.provider,
    required this.createdAt,
    this.lastLogin,
  });


  User.empty() :
    uid = "",
    email = "",
    photo = "",
    name = "",
    provider= "",
    createdAt = "";

  factory User.fromJson(Map<String, dynamic> json) => User(
        uid: json["uid"],
        email: json["email"],
        photo: json["photo"],
        name: json["name"],
        surname: json["surname"],
        emailVerified: json["emailVerified"],
        phoneNumber: json["phoneNumber"],
        storeToken: json["storeToken"],
        provider: json["provider"],
        createdAt: json["createdAt"],
        lastLogin: json["lastLogin"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "photo": photo,
        "name": name,
        "surname": surname,
        "phoneNumber": phoneNumber,
        "emailVerified": emailVerified,
        "storeToken": storeToken,
        "provider": provider,
        "createdAt": createdAt,
        "lastLogin": lastLogin,
      };

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return User(
      uid: data?["uid"],
      email: data?["email"],
      photo: data?["photo"],
      name: data?["name"],
      surname: data?["surname"],
      emailVerified: data?["emailVerified"],
      phoneNumber: data?["phoneNumber"],
      storeToken: data?["storeToken"],
      provider: data?["provider"],
      createdAt: data?["createdAt"],
      lastLogin: data?["lastLogin"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (uid != null) "uid": uid,
      if (email != null) "email": email,
      if (photo != null) "photo": photo,
      if (name != null) "name": name,
      if (surname != null) "surename": surname,
      if (phoneNumber != null) "phoneNumber": phoneNumber,
      if (emailVerified != null) "emailVerified": emailVerified,
      if (storeToken != null) "storeToken": storeToken,
      if (provider != null) "provider": provider,
      if (createdAt != null) "createdAt": createdAt,
      if (lastLogin != null) "lastLogin": lastLogin,
    };
  }
}
