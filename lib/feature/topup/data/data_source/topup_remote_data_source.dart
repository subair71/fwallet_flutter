import 'package:dio/dio.dart';
import 'package:mpay/core/common/app_array.dart';
import 'package:retrofit/retrofit.dart';

part 'topup_remote_data_source.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class TopUpRemoteDataSource {
  factory TopUpRemoteDataSource(Dio dio) = _TopUpRemoteDataSource;

  @POST('performTopUp/{id}')
  Future<HttpResponse<String>> performTopUp(
    @Body() Map<String, dynamic> params,
    @Path("id") String id,
  );
}
