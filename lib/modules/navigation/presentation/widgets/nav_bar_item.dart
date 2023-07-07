import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/assets/colors/colors.dart';
import 'package:test_app/modules/navigation/domain/entities/navbar.dart';
import '';

class NavItemWidget extends StatelessWidget {
  final int currentIndex;
  final NavBar navBar;

  const NavItemWidget({
    required this.navBar,
    required this.currentIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 11),
      child: Column(
        children: [
          Center(
            child: SvgPicture.asset(
              navBar.icon,
              color: currentIndex == navBar.id ? primaryColor : textGrey,
              height: 24,
              width: 24,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            navBar.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: currentIndex == navBar.id ? primaryColor : black),
          )
        ],
      ),
    );
  }
}
