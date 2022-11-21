// router_delegate.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_api_v2/route/route.dart';
import 'package:github_api_v2/screen/repository/repository_screen.dart';
import 'package:github_api_v2/screen/user/user_screen.dart';
import 'package:github_api_v2/screen/util/not_found_page.dart';

import '../controller/app_state.dart';
import 'configuration.dart';

class MyRouterDelegate extends RouterDelegate<Configuration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Configuration> {
  late AppState state;
  MyRouterDelegate() {
    this.state = AppState();
    this.state.addListener(notifyListeners);
  }

  @override
  void dispose() {
    super.dispose();
    state.removeListener(notifyListeners);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Configuration? get currentConfiguration {
    if (state.isError) {
      return Configuration.unknown();
    } else {
      if (state.user != null) {
        return Configuration.repository(user: state.user!);
      }
      return Configuration.user();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) {
        return _handlePopPage(route, result);
      },
      pages: [
        MaterialPage(
            key: ValueKey('user_screen'),
            child: UserScreen(
              onUserSelected: (user) {
                state.user = user;
              },
            )),
        if (state.user != null)
          MaterialPage(
              key: ValueKey('repository_screen'),
              child: RepositoryScreen(
                // username: state.user!.login!,
                user: state.user!
              )),
        if (state.isError)
          MaterialPage(key: ValueKey('not_found_page'), child: NotFoundPage()),
      ],
    );
  }

  bool _handlePopPage(Route route, result) {
    Page page = route.settings as Page;
    if (page.key == ValueKey("user_screen")) {
      return false;
    }

    route.didPop(result);

    if (page.key == ValueKey("repository_screen")) {
      state.user = null;
      return true;
    }
    if (page.key == ValueKey("not_found_page")) {
      state.user = null;
      return true;
    }
    return false;
  }

  @override
  Future<void> setNewRoutePath(Configuration configuration) async {
    if (configuration.isKnown) {
      if (configuration.route == Routes.USER) {
        state.isError = false;
        state.user = null;
        return;
      } else if (configuration.route == Routes.REPOSITORY) {
        Map<String, dynamic> arguments = configuration.arguments;
        if (arguments.containsKey("user")) {
          var user = arguments["user"];
          if (user != null) {
            state.isError = false;
            state.user = user;
            return;
          }
        }
      }
    }

    state.isError = true;
    state.user = null;
  }
}
