import 'package:api_test/core/bindings/controller_binder.dart';
import 'package:api_test/core/utils/theme/theme.dart';
import 'package:api_test/features/home/screen/home_screen.dart';
import 'package:api_test/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EverydayToolkit extends StatelessWidget {
  const EverydayToolkit({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // base design size (like iPhone X)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Everyday Toolkit',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoute.getHomeScreen(),
          getPages: AppRoute.routes,
          initialBinding: ControllerBinder(),
          home: child,
          themeMode: ThemeMode.system,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
        );
      },
      child: const HomeScreen(),
    );
  }
}
