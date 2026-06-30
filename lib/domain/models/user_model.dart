class UserModel {
  final int id;
  final String name;
  final DateTime createdAt;
  final String email;

  const UserModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.email,
  });
}
