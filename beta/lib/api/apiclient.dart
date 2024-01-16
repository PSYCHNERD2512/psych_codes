import 'package:beta/Request/loginInfo.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' as rt;
import 'package:beta/Response/LoginResponse.dart';

part 'apiclient.g.dart';

@rt.RestApi(baseUrl: '')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @rt.POST('/login') //login se pehle no session
  Future<LoginResponse> postLoginCred(@rt.Body() LoginRequest loginInfo);
}
