import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/data/datasources/current_time_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/terms_local_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/accept_terms/accept_terms_request.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/accept_terms/accept_terms_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/random_value.dart';
import 'terms_local_datasource_test.mocks.dart';

@GenerateMocks([CurrentTimeDatasource, SharedPreferences])
void main() {
  late CurrentTimeDatasource timeDatasource;
  late MockSharedPreferences sharedPreferences;
  late TermsLocalDatasourceImpl termsLocalDatasource;

  setUp(() {
    timeDatasource = MockCurrentTimeDatasource();
    sharedPreferences = MockSharedPreferences();
    termsLocalDatasource = TermsLocalDatasourceImpl(
      currentTimeDatasource: timeDatasource,
      sharedPreference: sharedPreferences,
    );
  });

  test('should call sharedPreferences setValue with correct key and value', () async {
    // arrange
    final dateTime = DateTime.now();
    when(timeDatasource.get()).thenAnswer((_) => Future.value(dateTime));
    when(sharedPreferences.setInt(any, any)).thenAnswer((_) async {
      return true;
    });

    final request = AcceptTermsRequest(userId: getRandomString(10));

    // act
    final response = await termsLocalDatasource.acceptTerms(request);

    // assert
    expect(response, AcceptTermsResponse(isSuccess: true));
    final key = '${request.userId}_terms_read';
    verify(sharedPreferences.setInt(key, dateTime.millisecondsSinceEpoch));
  });
}
