
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/app.dart';
import 'package:test_app/core/assets/theme/theme.dart';
import 'package:test_app/core/data/singleton/service_locator.dart';
import 'package:test_app/modules/auth/presentation/ui/login_screen.dart';
import 'package:test_app/modules/navigation/presentation/home.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      theme: AppTheme.theme(),
      home: App()
    );
  }
}
