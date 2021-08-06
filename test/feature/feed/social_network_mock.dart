import 'package:starter_project/view/home/social/service/social_service.dart';
import 'package:vexana/src/interface/INetworkService.dart';

class SocialNetworkMock extends SocialService {
  SocialNetworkMock(INetworkManager networkManager) : super(networkManager);
}
