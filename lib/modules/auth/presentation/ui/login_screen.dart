import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/assets/colors/colors.dart';
import 'package:test_app/core/data/singleton/service_locator.dart';
import 'package:test_app/globals/bloc/auth/authentication_bloc.dart';
import 'package:test_app/globals/widgets/interaction/w_button.dart';
import 'package:test_app/globals/widgets/interaction/w_textfield.dart';
import 'package:test_app/modules/auth/data/repository/auth_impl.dart';
import 'package:test_app/modules/auth/domain/usecase/login_user.dart';
import 'package:test_app/modules/auth/presentation/bloc/login_bloc.dart';
import 'package:test_app/utils/status.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc loginBloc;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    loginBloc = LoginBloc(
        login: LoginUseCase(repo: serviceLocator<AuthRepositoryImpl>()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Авторизация',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, color: black),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WTextField(
                    borderRadius: 0,
                    controller: emailController,
                    fillColor: white,
                    hintText: 'Логин или почта',
                    hasBorderColor: false,
                    onChanged: (text) {},
                    height: 60,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      color: divider,
                      height: 1,
                    ),
                  ),
                  WTextField(
                    borderRadius: 0,
                    controller: passwordController,
                    fillColor: white,
                    hintText: 'Пароль',
                    hasBorderColor: false,
                    onChanged: (text) {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            WButton(
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              onTap: () {
                if (emailController.text.isNotEmpty &&
                    passwordController.text.length > 3) {
                  loginBloc.add(LoginEvent.login(
                      email: emailController.text,
                      password: passwordController.text,
                      onError: (message) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.grey,
                            content: Text(
                              message,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: white),
                            )));
                      },
                      onSuccess: () {
                        context.read<AuthenticationBloc>().add(
                            AuthenticationStatusChange(
                                status: AuthenticationStatus.authenticated));
                      }));
                }
              },
              text: 'Войти',
              height: 64,
              borderRadius: 6,
            ),
            const SizedBox(
              height: 20,
            ),
            WButton(
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              onTap: () {},
              text: 'Зарегистрироваться',
              height: 64,
              borderRadius: 6,
            ),
          ],
        ),
      );
}
