import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/get_logged_in_user.dart';
import 'package:oic_next_to_you/features/main/domain/usecases/user_logout.dart';
import 'package:oic_next_to_you/features/main/presentation/providers/main_screen_provider.dart';

import 'main_screen_provider_test.mocks.dart';

@GenerateMocks([UserLogout, GetLoggedInUser])
void main() {
  late MockUserLogout userLogout;
  late MockGetLoggedInUser getLoggedInUser;
  late MainScreenProvider provider;

  setUp(() {
    userLogout = MockUserLogout();
    getLoggedInUser = MockGetLoggedInUser();
    provider = MainScreenProvider(
      userLogout: userLogout,
      getLoggedInUser: getLoggedInUser,
    );
  });

  group('logout', () {
    test('should call userLogout', () async {
      // arrange
      when(userLogout()).thenAnswer((_) => Future.value(true));

      // act
      await provider.logout();

      // assert
      verify(userLogout());
    });

    test('should update loggedOut to true', () async {
      // arrange
      when(userLogout()).thenAnswer((_) => Future.value(true));
      var storedState = <bool>[];
      provider.addListener(() {
        storedState.add(provider.state.loggedOut);
      });

      // act
      await provider.logout();

      // assert
      expect(storedState.length, 1);
      expect(storedState.last, true);
    });
  });
}
