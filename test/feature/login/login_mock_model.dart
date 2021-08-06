import 'package:vexana/vexana.dart';

class LoginMockModel extends INetworkModel<LoginMockModel> {
  final String? email;
  final String? password;
  LoginMockModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginMockModel.fromMap(Map<String, dynamic> map) {
    return LoginMockModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  @override
  LoginMockModel fromJson(Map<String, dynamic> json) {
    return LoginMockModel.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return toMap();
  }
}

class LoginMockResponseModel extends INetworkModel<LoginMockResponseModel> {
  final String? token;
  LoginMockResponseModel({
    this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory LoginMockResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginMockResponseModel(
      token: map['token'] as String,
    );
  }

  @override
  LoginMockResponseModel fromJson(Map<String, dynamic> json) {
    return LoginMockResponseModel.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return toMap();
  }
}
