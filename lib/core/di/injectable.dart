import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mpay/feature/beneficiary/data/data_source/beneficiary_remote_data_source.dart';
import 'package:mpay/feature/beneficiary/data/repository/add_beneficiary_repository_impl.dart';
import 'package:mpay/feature/beneficiary/data/repository/beneficiary_repository_impl.dart';
import 'package:mpay/feature/beneficiary/domain/repository/beneficiary_repository.dart';
import 'package:mpay/feature/beneficiary/domain/usecase/add_beneficiary.dart';
import 'package:mpay/feature/beneficiary/domain/usecase/check_beneficiary.dart';
import 'package:mpay/feature/beneficiary/domain/usecase/get_all_beneficiaries.dart';
import 'package:mpay/feature/beneficiary/presentation/bloc/beneficiary_bloc.dart';
import 'package:mpay/feature/topup/data/data_source/topup_remote_data_source.dart';
import 'package:mpay/feature/topup/data/repository/topup_repository_impl.dart';
import 'package:mpay/feature/topup/domain/repository/topup_repository.dart';
import 'package:mpay/feature/topup/domain/usecase/get_topup_options.dart';
import 'package:mpay/feature/topup/domain/usecase/perform_topup.dart';
import 'package:mpay/feature/topup/presentation/bloc/top_up_bloc.dart';
import 'package:mpay/feature/user/data/data_source/user_remote_datasource.dart';
import 'package:mpay/feature/user/data/repository/user_repository_impl.dart';
import 'package:mpay/feature/user/domain/repository/user_repository.dart';
import 'package:mpay/feature/user/domain/usecase/get_user_details_usecase.dart';
import 'package:mpay/feature/user/presentation/bloc/user_bloc.dart';
import 'package:mpay/core/infrastructure/dio_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  /*------------------------------ DIO --------------------------------*/
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(DioInterceptor());
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    return dio;
  });

  /*------------------------------ User --------------------------------*/

  // User Remote Data Source
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSource(sl<Dio>()),
  );

  // User Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl<UserRemoteDataSource>()),
  );

  // Use Case
  sl.registerLazySingleton<GetUserDetails>(
    () => GetUserDetails(sl<UserRepository>()),
  );

  // User Bloc
  sl.registerFactory<UserBloc>(
    () => UserBloc(sl<GetUserDetails>()),
  );

  /*------------------------------ Top-Up --------------------------------*/

  // Top-Up Remote Data Source
  sl.registerLazySingleton<TopUpRemoteDataSource>(
    () => TopUpRemoteDataSource(sl<Dio>()),
  );

  // Top-Up Repository
  sl.registerLazySingleton<TopUpRepository>(
    () => TopUpRepositoryImpl(sl<TopUpRemoteDataSource>()),
  );

  // Perform Top-Up Use Case
  sl.registerLazySingleton<PerformTopUp>(
    () => PerformTopUp(sl<TopUpRepository>()),
  );

  sl.registerLazySingleton<GetTopUpOptions>(
    () => GetTopUpOptions(),
  );

  // Top-Up Bloc
  sl.registerFactory<TopUpBloc>(
    () => TopUpBloc(sl<GetTopUpOptions>(),sl<PerformTopUp>()),
  );



  /*------------------------------ Remote Data Source --------------------------------*/
  sl.registerLazySingleton<BeneficiaryRemoteDataSource>(
    () => BeneficiaryRemoteDataSource(sl<Dio>()),
  );

  /*------------------------------ Repository --------------------------------*/
  sl.registerLazySingleton<BeneficiaryRepository>(
    () => BeneficiaryRepositoryImpl(sl<BeneficiaryRemoteDataSource>()),
  );

  sl.registerLazySingleton<AddBeneficiaryRepository>(
    () => AddBeneficiaryRepositoryImpl(sl<BeneficiaryRemoteDataSource>()),
  );

  /*------------------------------ Use Cases --------------------------------*/
  sl.registerLazySingleton<AddBeneficiary>(
    () => AddBeneficiary(sl<AddBeneficiaryRepository>()),
  );

  sl.registerLazySingleton<CheckBeneficiary>(
    () => CheckBeneficiary(sl<BeneficiaryRepository>()),
  );

  sl.registerLazySingleton<GetAllBeneficiaries>(
    () => GetAllBeneficiaries(sl<BeneficiaryRepository>()),
  );

  /*------------------------------ Bloc --------------------------------*/
  sl.registerFactory<BeneficiaryBloc>(
    () => BeneficiaryBloc(
      addBeneficiaryUseCase: sl<AddBeneficiary>(),
      checkBeneficiaryUseCase: sl<CheckBeneficiary>(),
      getAllBeneficiariesUseCase: sl<GetAllBeneficiaries>(),
    ),
  );
}
