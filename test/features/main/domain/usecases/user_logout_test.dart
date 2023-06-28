import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/features/auth/domain/repositories/user_repository.dart';
import 'package:oic_next_to_you/features/main/domain/usecases/user_logout.dart';

import 'user_logout_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late UserLogout useCase;
  late UserRepository repository;

  setUp((){
    repository = MockUserRepository();
    useCase = UserLogout(userRepository: repository);
  });

  test('call should call repository.logout', () async {
    // arrange
    when(repository.logout()).thenAnswer((_) => Future.value(true));

    // act
    await useCase();

    // assert
    verify(repository.logout());
  });
}
