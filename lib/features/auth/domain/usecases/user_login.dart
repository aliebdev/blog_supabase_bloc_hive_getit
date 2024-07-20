import 'package:fpdart/fpdart.dart';

import '../../../../core/common/cubits/entities/user.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class UserLogin implements Usecase<User, UserLoginParams> {
  final AuthRepository authRepository;

  const UserLogin(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async =>
      await authRepository.loginWithEmailPassword(
        email: params.email,
        password: params.password,
      );
}

class UserLoginParams {
  final String email, password;

  UserLoginParams({
    required this.email,
    required this.password,
  });
}
