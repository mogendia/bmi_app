import 'package:bmi/styles/themes.dart';
import 'package:bmi/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/app_cubit.dart';
import 'cubit/app_states.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'network/local_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool isDarkCached = CacheHelper.getBool(key: 'isDark')??false;
  runApp(MyApp(isDarkCached));
}
class MyApp extends StatelessWidget {
  final isDarkCached;
  const MyApp(this.isDarkCached, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..themeToggle(isDarkCached: isDarkCached),
      child: BlocConsumer<AppCubit,AppStates>(
        builder: (context,state) {
          return MaterialApp(
            builder: (context, child) => ResponsiveWrapper.builder(
                BouncingScrollWrapper.builder(context, child!),
                maxWidth: 1080,
                minWidth: 440,
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(440, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ],
                background: Container(color: const Color(0xFFF5F5F5))),
            themeMode: AppCubit.get(context).isDark? ThemeMode.light : ThemeMode.dark,
            darkTheme: darkTheme,
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        },
        listener: (context,state){},
      ),
    );
  }
}
