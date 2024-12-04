class UserModel {
  final String name;
  final String email;
  final String password;
  final String avatar;
  final int id;

  UserModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.avatar,
      required this.id});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      name: jsonData['name'],
      email: jsonData['email'],
      password: jsonData['password'],
      avatar: jsonData['avatar'],
      id: jsonData['id'],
    );
  }
}
