import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/my_bloc_observer.dart';
import 'package:e_commerce/core/utils/app_theme.dart';
import 'package:e_commerce/features/ui/auth/login/login_screen.dart';
import 'package:e_commerce/features/ui/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';
import 'core/utils/app_routes.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.loginRouteName,
          routes: {
            AppRoutes.loginRouteName : (context) => LoginScreen(),
            AppRoutes.registerRouteName : (context) => RegisterScreen(),

          },
          theme: AppTheme.lightTheme ,
          themeMode: ThemeMode.light,

        );
      },
    );
  }
}
