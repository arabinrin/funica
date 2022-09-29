class UserModel {
  final String fName;
  final String password;
  final String lName;
  final String email;
  final String age;
  final String location;
  final String phoneNum;

  UserModel(
      {required this.email,
      required this.fName,
      required this.lName,
      required this.password,
      required this.age,
      required this.location,
      required this.phoneNum});
}
