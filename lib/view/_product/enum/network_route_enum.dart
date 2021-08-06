enum NetWorkRoutes { LOGIN, PHOTOS }

extension NetworkRoutesString on NetWorkRoutes {
  String get rawValue {
    switch (this) {
      case NetWorkRoutes.LOGIN:
        return '/login';
      case NetWorkRoutes.PHOTOS:
        return '/photos';
      default:
        throw Exception('Route not found');
    }
  }
}
