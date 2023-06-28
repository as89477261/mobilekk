import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:oic_next_to_you/common/data/datasources/current_time_datasource.dart';
import 'package:oic_next_to_you/common/data/datasources/internet_connection_datasource.dart';
import 'package:oic_next_to_you/common/data/services/api_service.dart';
import 'package:oic_next_to_you/features/agent_info/data/datasources/agent_info_datasource.dart';
import 'package:oic_next_to_you/features/agent_info/data/repositories/agent_info_repository_impl.dart';
import 'package:oic_next_to_you/features/agent_info/domain/repositories/agent_info_repository.dart';
import 'package:oic_next_to_you/features/agent_info/domain/usecases/validate_agent_license_id.dart';
import 'package:oic_next_to_you/features/agent_info/presentation/providers/agent_info_provider.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/local_credential_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/local_logged_in_user_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/network_otp_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/network_user_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/repositories/otp_repository_impl.dart';
import 'package:oic_next_to_you/features/auth/data/repositories/user_repository_impl.dart';
import 'package:oic_next_to_you/features/auth/domain/repositories/otp_repository.dart';
import 'package:oic_next_to_you/features/auth/domain/repositories/user_repository.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/get_logged_in_user.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/request_otp_with_phone_number.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/verify_otp_of_phone_number.dart';
import 'package:oic_next_to_you/features/auth/presentation/providers/login_screen_provider.dart';
import 'package:oic_next_to_you/features/auth/presentation/providers/otp_provider.dart';
import 'package:oic_next_to_you/features/auth/presentation/providers/splash_screen_provider.dart';
import 'package:oic_next_to_you/features/auth/presentation/routers/login_router.dart';
import 'package:oic_next_to_you/features/auth/presentation/routers/otp_router.dart';
import 'package:oic_next_to_you/features/auth/presentation/routers/splash_router.dart';
import 'package:oic_next_to_you/features/main/domain/usecases/user_logout.dart';
import 'package:oic_next_to_you/features/main/presentation/providers/main_screen_provider.dart';
import 'package:oic_next_to_you/features/main/presentation/routers/main_router.dart';
import 'package:oic_next_to_you/features/recording/presentation/recording/recording_router.dart';
import 'package:oic_next_to_you/features/recording/data/datasources/record_datasource.dart';
import 'package:oic_next_to_you/features/recording/data/repositories/record_repository_impl.dart';
import 'package:oic_next_to_you/features/recording/domain/repositories/record_repository.dart';
import 'package:oic_next_to_you/features/recording/domain/usecases/calculate_text_risk.dart';
import 'package:oic_next_to_you/features/recording/domain/usecases/check_agent_information.dart';
import 'package:oic_next_to_you/features/recording/domain/usecases/finish_recording.dart';
import 'package:oic_next_to_you/features/recording/domain/usecases/start_recording.dart';
import 'package:oic_next_to_you/features/recording/presentation/recording/recording_provider.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/accept_consent_local_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/accept_consent_network_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/consent_network_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/terms_local_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/terms_network_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/repositories/consent_repository_impl.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/repositories/terms_repository_impl.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/repositories/consent_repository.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/repositories/terms_repository.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/accept_consent.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/accept_terms.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/get_updated_consent.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/get_updated_terms.dart';
import 'package:oic_next_to_you/features/terms_and_consent/presentation/consent_screen/consent_router.dart';
import 'package:oic_next_to_you/features/terms_and_consent/presentation/consent_screen/consent_screen_provider.dart';
import 'package:oic_next_to_you/features/terms_and_consent/presentation/terms_screen/terms_router.dart';
import 'package:oic_next_to_you/features/terms_and_consent/presentation/terms_screen/terms_screen_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final di = GetIt.instance;

Future registerDI() async {
  // Common
  final connectivity = Connectivity();
  di.registerSingleton<InternetConnectionDatasource>(
      ConnectivityPlusInternetConnectionDatasource(connectivity));

  // Auth
  await _registerCommon();
  await _registerAuth();
  await _registerTermsAndConsent();

  // Main
  await _registerMain();

  // Record
  await _registerRecord();

  // Agent Info
  await _registerAgentInfo();
}

Future<void> _registerCommon() async {
  di.registerSingleton(
    ApiService(),
  );

  di.registerSingleton<CurrentTimeDatasource>(CurrentTimeDatasourceImpl());
  di.registerSingletonAsync(() => SharedPreferences.getInstance());
}

Future<void> _registerAuth() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  di.registerLazySingleton<LocalLoggedInUserDatasource>(() =>
      SharedPreferenceLocalLoggedInUserDatasource(
          sharedPreferences: sharedPreferences));
  di.registerLazySingleton<NetworkUserDatasource>(
      () => NetworkUserDatasourceImpl(di()));
  di.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
      localLoggedInUserDatasource: di(), networkUserDatasource: di()));

  di.registerSingleton(FirebaseAuth.instance);
  di.registerSingleton(PhoneAuthProviderWrapper());
  di.registerLazySingleton<LocalVerificationIdDatasource>(
      () => InMemoryLocalCredentialDatasource());
  di.registerLazySingleton<NetworkOtpDatasource>(() =>
      FirebaseAuthOtpDatasource(auth: di(), phoneAuthProviderWrapper: di()));
  di.registerLazySingleton<OtpRepository>(() => OtpRepositoryImpl(
        internetConnectionDatasource: di(),
        localVerificationIdDatasource: di(),
        networkOtpDatasource: di(),
        userRepository: di(),
      ));

  _registerSplash();
  _registerLogin();
  _registerOtp();
}

void _registerSplash() {
  di.registerSingleton<SplashRouter>(SplashRouterImpl());

  di.registerSingleton(GetLoggedInUser(userRepository: di()));
  di.registerFactory<SplashScreenProvider>(
      () => SplashScreenProvider(getLoggedInUser: di()));
}

void _registerLogin() {
  di.registerSingleton(RequestOtpWithPhoneNumber(di()));
  di.registerFactory<LoginScreenProvider>(() => LoginScreenProvider(
      LoginScreenUIState(),
      requestOtpWithPhoneNumber: di()));
  di.registerSingleton<LoginRouter>(LoginRouterImpl());
}

void _registerOtp() {
  di.registerSingleton(VerifyOtpAndGetUserFromPhoneNumber(di()));
  di.registerFactory<OtpScreenProvider>(
    () => OtpScreenProvider(OtpUIState(),
        requestOtpWithPhoneNumber: di(),
        verifyOtpAndGetUserFromPhoneNumber: di()),
  );
  di.registerSingleton<OtpRouter>(OtpRouterImpl());
}

Future<void> _registerTermsAndConsent() async {
  // Terms
  final remoteConfig = FirebaseRemoteConfig.instance;
  remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 30),
      minimumFetchInterval: Duration(minutes: 1)));
  di.registerSingleton<TermsNetworkDatasource>(
      RemoteConfigTermsNetworkDatasource(firebaseRemoteConfig: remoteConfig));
  di.registerSingleton<TermsLocalDatasource>(TermsLocalDatasourceImpl(
      currentTimeDatasource: di(), sharedPreference: di()));

  di.registerSingleton<TermsRepository>(TermsRepositoryImpl(
      internetConnectionDatasource: di(),
      localLoggedInUserDatasource: di(),
      termsLocalDatasource: di(),
      termsNetworkDatasource: di()));

  di.registerSingleton(GetUpdatedTerms(di()));
  di.registerSingleton(AcceptTerms(termsRepository: di()));
  di.registerFactory(
      () => TermsScreenProvider(TermsScreenUIState(), di(), di()));
  di.registerSingleton<TermsRouter>(TermsRouterImpl());

  // Consent
  di.registerSingleton<ConsentNetworkDatasource>(
      ConsentNetworkDatasourceImpl(remoteConfig: remoteConfig));
  di.registerSingleton<AcceptConsentLocalDatasource>(
      ConsentLocalDatasourceImpl(sharedPreferences: di()));
  di.registerSingleton<AcceptConsentNetworkDatasource>(
      AcceptConsentNetworkDatasourceImpl(di()));

  di.registerSingleton<ConsentRepository>(ConsentRepositoryImpl(
      internetConnectionDatasource: di(),
      localLoggedInUserDatasource: di(),
      acceptConsentNetworkDatasource: di(),
      consentLocalDatasource: di(),
      consentNetworkDatasource: di()));

  di.registerSingleton(GetUpdatedConsent(di()));
  di.registerSingleton(AcceptConsent(consentRepository: di()));
  di.registerFactory(() => ConsentScreenProvider(
      getUpdatedConsentUsecase: di(), acceptConsentUsecase: di()));
  di.registerSingleton<ConsentRouter>(ConsentRouterImpl());
}

Future<void> _registerMain() async {
  di.registerSingleton(UserLogout(userRepository: di()));
  di.registerFactory(
      () => MainScreenProvider(userLogout: di(), getLoggedInUser: di()));
  di.registerSingleton<MainRouter>(MainRouterImpl());
}

Future<void> _registerRecord() async {
  di.registerSingleton<RecordDatasource>(RecordDatasourceImpl());
  di.registerSingleton<RecordRepository>(
      RecordRepositoryImpl(datasource: di()));
  di.registerFactory(() => RecordingProvider(
      startRecording: StartRecording(),
      calculateTextRisk: CalculateTextRisk(repository: di()),
      checkAgentInformation: CheckAgentInformation(),
      finishRecording: FinishRecording()));
  di.registerSingleton<RecordRouter>(RecordRouterImpl());
}

Future<void> _registerAgentInfo() async {
  // datasources
  di.registerLazySingleton<AgentInfoDatasource>(
      () => AgentInfoDatasourceImpl(di()));

  // repositories
  di.registerLazySingleton<AgentInfoRepository>(
      () => AgentInfoRepositoryImpl(di()));

  // usecases
  di.registerLazySingleton(() => ValidateAgentLicenseId(di()));

  // providers
  di.registerFactory(() => AgentInfoProvider(di()));
}
