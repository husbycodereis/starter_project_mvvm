import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../navigation/navigation_service.dart';
import 'on_board_notifier.dart';
import 'theme_notifier.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider? get instance {
    return _instance ??= ApplicationProvider._init();
  }

  ApplicationProvider._init();
  //for proxy items such as proxyprovder or streamprovider
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context) => ThemeNotifier()),
    ChangeNotifierProvider(create: (context) => OnBoardAndLoginNotifier()),
    Provider.value(value: NavigationService.instance)
  ];

  List<SingleChildWidget> uiChangeItems = [];

  List<SingleChildWidget> singleItems = [];
}
