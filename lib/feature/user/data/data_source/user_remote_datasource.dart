import 'package:dio/dio.dart';
import 'package:mpay/core/common/app_array.dart';
import 'package:retrofit/retrofit.dart';

part 'user_remote_datasource.g.dart';

@RestApi(baseUrl: kBaseUrl) // Set your base URL here
abstract class UserRemoteDataSource {
  factory UserRemoteDataSource(Dio dio) = _UserRemoteDataSource;

  @GET('getUserDetails/{id}')
  Future<HttpResponse<String>> getUserDetails(
    @Path("id") String id,
  );
}
