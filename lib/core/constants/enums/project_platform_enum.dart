import 'dart:io';

enum PlatformProject { IOS, ANDROID }

extension PlatformProjectExtension on PlatformProject {
  int get versionNumber {
    return Platform.isIOS ? PlatformProject.IOS.index : PlatformProject.ANDROID.index;
  }
}
