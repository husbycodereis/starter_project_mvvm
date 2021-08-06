enum UserQueryEnum { ALBUMID, ID }

extension UserQueryEnumString on UserQueryEnum {
  String get rawValue {
    switch (this) {
      case UserQueryEnum.ALBUMID:
        return 'albumId';
      case UserQueryEnum.ID:
        return 'id';
      default:
        throw Exception('Routes Not Found');
    }
  }
}
