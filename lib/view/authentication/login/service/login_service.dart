import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/_utility/service_helper.dart';
import '../../../_product/enum/network_route_enum.dart';
import '../model/login_model.dart';
import '../model/login_response_model.dart';
import 'ILoginService.dart';

class LoginService extends ILoginService with ServiceHelper {
  LoginService(INetworkManager manager) : super(manager: manager);

  @override
  Future<LoginResponseModel?> fetchUserControl(LoginModel model, BuildContext context) async {
    final response = await manager.send<LoginResponseModel, LoginResponseModel>(
        NetWorkRoutes.LOGIN.rawValue,
        parseModel: LoginResponseModel(),
        method: RequestType.POST,
        data: model);
    showMessage(response.error, context);
    if (response.data is LoginResponseModel) {
      return response.data;
    } else {
      return null;
    }
  }
}
