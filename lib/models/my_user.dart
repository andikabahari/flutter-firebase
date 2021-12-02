class MyUser {
  String? uid;

  MyUser({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final int chilies;
  final int spicyLevel;

  UserData({
    required this.uid,
    required this.name,
    required this.chilies,
    required this.spicyLevel,
  });
}
