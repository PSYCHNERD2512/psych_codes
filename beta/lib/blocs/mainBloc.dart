import 'package:beta/Request/loginInfo.dart';
import 'package:beta/api/apiclient.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class mainBloc {
  late final ApiClient client;
  final dio = Dio();
  mainBloc() {
    client = ApiClient(dio);
  }
  Future<void> loginBloc(LoginRequest lr) async {
    await client.postLoginCred(lr);
  }
}
