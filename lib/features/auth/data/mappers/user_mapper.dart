import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

class UserMapper {
  static UserModel toModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      fullName: entity.fullName,
      createdAt: entity.createdAt,
    );
  }

  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      email: model.email,
      fullName: model.fullName,
      createdAt: model.createdAt,
    );
  }
}
