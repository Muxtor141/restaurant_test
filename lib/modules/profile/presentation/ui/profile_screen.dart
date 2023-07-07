import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/assets/colors/colors.dart';
import 'package:test_app/core/assets/constants/app_icons.dart';
import 'package:test_app/globals/bloc/auth/authentication_bloc.dart';
import 'package:test_app/globals/widgets/popups/adaptive_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(centerTitle: true,
          elevation: 0,
          title: const Text(
            'Профиль',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, color: black),
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 38,
                      ),
                      SvgPicture.asset(
                        AppIcons.profileCircle,
                        width: 64,
                        height: 64,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        state.user.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        state.user.email,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: textGrey),
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      GestureDetector(
                        onTap: () {
                          showAdaptiveDialog(context,
                              title: 'Выход из системы',
                              bodyText: 'Вам нужно будет снова войти в систему',
                              onTapPositive: (c) {
                            Navigator.pop(c);
                            context
                                .read<AuthenticationBloc>()
                                .add(LogOutUser());
                          }, positiveButtonTitle: 'Выйти');
                        },
                        child: Container(
                          width: double.maxFinite,
                          decoration: const BoxDecoration(color: white),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          child: const Text(
                            'Выйти',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: red),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
}
