import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/assets/theme/theme.dart';
import 'package:test_app/core/data/singleton/service_locator.dart';
import 'package:test_app/core/data/singleton/storage.dart';
import 'package:test_app/globals/bloc/auth/authentication_bloc.dart';
import 'package:test_app/modules/auth/data/repository/auth_impl.dart';
import 'package:test_app/modules/auth/presentation/ui/login_screen.dart';
import 'package:test_app/modules/navigation/presentation/home.dart';
import 'package:test_app/modules/navigation/presentation/navigator.dart';
import 'package:test_app/modules/profile/domain/usecase/get_profile.dart';
import 'package:test_app/utils/status.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (c) => AuthenticationBloc(
                  GetProfileUseCase(repo: serviceLocator<AuthRepositoryImpl>()))
                ..add(CheckUserEvent())),
        ],
        child: MaterialApp(
          theme: AppTheme.theme(),
          navigatorKey: _navigatorKey,
          builder: (context, child) =>
              BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  _navigator.pushAndRemoveUntil(
                      fade(page: const NavigationScreen()), (route) => false);

                  break;
                case AuthenticationStatus.unauthenticated:
                  _navigator.pushAndRemoveUntil(
                      fade(page: LoginScreen()), (route) => false);
                  break;

                case AuthenticationStatus.unknown:
                  _navigator.pushAndRemoveUntil(
                      fade(page: const LoginScreen()), (route) => false);
                  break;
              }
            },
            child: child,
          ),
          onGenerateRoute: (_) => MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Container(
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            ),
          ),
        ),
      );
}
