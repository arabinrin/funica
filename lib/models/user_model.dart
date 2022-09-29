class UserModel {
  final String username;
  final String email;

  final String password;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
  });
}

class UserDetail {
  final String? fName;
  final String? nickname;
  final String? email;
  final String? birthday;
  final String? gender;
  final String? phoneNum;
  final String? imgUrl;

  UserDetail(
      {this.email,
      this.fName,
      this.nickname,
      this.birthday,
      this.gender,
      this.phoneNum,
      this.imgUrl});
}
