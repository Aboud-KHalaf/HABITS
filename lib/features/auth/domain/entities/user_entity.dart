class UserEntity {
  final String id;
  final String email;
  final String fullName;
  final DateTime? createdAt;

  const UserEntity({
    required this.id,
    required this.email,
    required this.fullName,
    this.createdAt,
  });

  UserEntity copyWith({
    String? id,
    String? email,
    String? fullName,
    DateTime? createdAt,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
