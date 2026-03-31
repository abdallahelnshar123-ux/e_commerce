import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/my_bloc_observer.dart';
import 'package:e_commerce/core/utils/app_theme.dart';
import 'package:e_commerce/features/ui/auth/login/login_screen.dart';
import 'package:e_commerce/features/ui/auth/register/register_screen.dart';
import 'package:e_commerce/features/ui/home_screen/home_screen.dart';
import 'package:e_commerce/features/ui/product_details_screen/cubit/product_details_view_model.dart';
import 'package:e_commerce/features/ui/product_details_screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'core/cache/shared_prefs_utils.dart';
import 'core/di/di.dart';
import 'core/utils/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsUtils.init();
  var token = SharedPrefsUtils.getData(key: ShredPrefsKeys.tokenKey);
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => getIt<ProductDetailsViewModel>(),)
  ],
  child: MyApp(token: token)));
}

class MyApp extends StatelessWidget {
  final Object? token;

  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: token == null
              ? AppRoutes.loginRouteName
              : AppRoutes.homeRouteName,
          routes: {
            AppRoutes.loginRouteName: (context) => LoginScreen(),
            AppRoutes.registerRouteName: (context) => RegisterScreen(),
            AppRoutes.homeRouteName: (context) => HomeScreen(),
            AppRoutes.productDetailsRouteName: (context) =>
                ProductDetailsScreen(),
          },
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
