import 'package:flutter/material.dart';
import 'screen_config.dart';

class NavigationManager extends RouterDelegate<ScreenConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ScreenConfig> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  factory NavigationManager() => _instance;
  static final NavigationManager _instance = NavigationManager._();
  static NavigationManager get instance => _instance;
  NavigationManager._();

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  final List<Page<dynamic>> _pages = <Page<dynamic>>[];

  @override
  ScreenConfig? get currentConfiguration =>
      _pages.last.arguments as ScreenConfig?;

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        onPopPage: _onPopPage,
        pages: List<Page<dynamic>>.of(_pages),
      );

  @override
  Future<void> setNewRoutePath(ScreenConfig configuration) async {
    _pages.clear();
    addPage(configuration);
  }

  @override
  Future<void> setInitialRoutePath(ScreenConfig configuration) async =>
      setNewRoutePath(configuration);

  void addPage(ScreenConfig newScreen) {
    if (_canAdd(newScreen)) _addPageHelper(newScreen);
  }

  void replacePage(ScreenConfig newScreen) {
    if (_canAdd(newScreen)) {
      _pages.removeLast();
      _addPageHelper(newScreen);
    }
  }

  bool _canAdd(ScreenConfig newScreen) {
    if (_pages.isEmpty) return true;
    return (_pages.last.arguments as ScreenConfig?)?.path != newScreen.path;
  }

  void _addPageHelper(ScreenConfig newScreen) {
    _pages.add(MaterialPage<dynamic>(
      child: newScreen.builder(),
      key: Key(newScreen.path) as LocalKey,
      name: newScreen.path,
      arguments: newScreen,
    ));
    notifyListeners();
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final bool didPop = route.didPop(result);
    if (!didPop) return false;
    _pages.remove(route.settings);
    notifyListeners();
    return true;
  }

  @override
  Future<bool> popRoute() async {
    if (canPop) {
      _pages.removeLast();
      notifyListeners();
      return Future<bool>.value(true);
    }
    return _confirmAppExit();
  }

  Future<bool> _confirmAppExit() async =>
      // return showDialog<bool>(
      //     context: navigatorKey.currentContext!,
      //     builder: (context) {
      //       return AlertDialog(
      //         title: const Text('Exit App'),
      //         content: const Text('Are you sure you want to exit the app?'),
      //         actions: [
      //           TextButton(
      //             child: const Text('Cancel'),
      //             onPressed: () => Navigator.pop(context, true),
      //           ),
      //           TextButton(
      //             child: const Text('Confirm'),
      //             onPressed: () => Navigator.pop(context, false),
      //           ),
      //         ],
      //       );
      //     }).then((value) => value ?? false);
      Future<bool>.value(false);

  bool get canPop => _pages.length > 1;
}
