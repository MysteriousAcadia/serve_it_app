import 'package:chopper/chopper.dart';
import 'package:serveit/constants.dart';

// part 'serveit_api_service.chopper.dart';

@ChopperApi(baseUrl: "http://localhost:4192/api/v1")
abstract class ServeitAPIService extends ChopperService {
  
  @Post(path: '/login')
  Future<Response> login(@Query("token") String firebaseToken);

}
