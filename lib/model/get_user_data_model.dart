class GetUserDataModel {
  final String email;
  final String password;
  final String name;
  final String avatar;
  final int id;

  GetUserDataModel({
    required this.email,
    required this.password,
    required this.name,
    required this.avatar,
    required this.id,
  });

  factory GetUserDataModel.fromJson(Map<String, dynamic> jsonData) {
    return GetUserDataModel(
      email: jsonData['email'],
      password: jsonData['password'],
      name: jsonData['name'],
      avatar: jsonData['avatar'],
      id: jsonData['id'],
    );
  }
}
