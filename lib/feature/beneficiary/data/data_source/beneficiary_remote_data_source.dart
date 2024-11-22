import 'package:dio/dio.dart';
import 'package:mpay/core/common/app_array.dart';
import 'package:retrofit/retrofit.dart';

part 'beneficiary_remote_data_source.g.dart';

@RestApi(baseUrl: kBaseUrl) 
abstract class BeneficiaryRemoteDataSource {
  factory BeneficiaryRemoteDataSource(Dio dio) = _BeneficiaryRemoteDataSource;

  @GET('listBeneficiaries/{id}')
  Future<HttpResponse<String>> getAllBeneficiaries(
    @Path("id") String id,
  );

   @POST('addBeneficiary')
  Future<HttpResponse<String>> addBeneficiary(@Body() Map<String,dynamic> params,
    
  );
}
