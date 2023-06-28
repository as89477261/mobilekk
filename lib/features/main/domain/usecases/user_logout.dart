import 'package:oic_next_to_you/features/auth/domain/repositories/user_repository.dart';

class UserLogout {
  final UserRepository userRepository;
  UserLogout({required this.userRepository});
  Future<bool> call() async {
    return userRepository.logout();
  }
}