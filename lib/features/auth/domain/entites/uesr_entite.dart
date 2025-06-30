class UserEntity {
  final String name;
  final String email;
  final String id;
  final String? token;

  const UserEntity({
    required this.name,
    required this.email,
    required this.id,
    this.token,
  });
}
