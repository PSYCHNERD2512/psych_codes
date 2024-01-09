import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  final _loginController = BehaviorSubject<bool>();

  StreamSink<String> get usernameSink => _usernameController.sink;
  StreamSink<String> get passwordSink => _passwordController.sink;

  Stream<bool> get loginStream => _loginController.stream;

  LoginBloc() {
    Stream<bool> loginResult = Rx.combineLatest2(
      _usernameController.stream,
      _passwordController.stream,
      (String username, String password) =>
          username.isNotEmpty && password.isNotEmpty,
    );

    loginResult.listen((bool canLogin) {
      _loginController.add(canLogin);
    });
  }

  Future<void> login() async {
    String username = _usernameController.value ?? '';
    String password = _passwordController.value ?? '';

    final loginUrl = 'http://127.0.0.1:8000/login';
    final loginBody = jsonEncode({'username': username, 'password': password});

    try {
      final response = await http.post(Uri.parse(loginUrl),
          headers: {'Content-Type': 'application/json'}, body: loginBody);

      if (response.statusCode == 200) {
        print('Login successful!');
      } else {
        print('Login failed. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during login request: $error');
    }
  }

  void dispose() {
    _usernameController.close();
    _passwordController.close();
    _loginController.close();
  }
}
