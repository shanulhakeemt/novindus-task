import 'package:flutter/material.dart';
import 'package:novindus_task/core/notifiers/current_user_notifier.dart';
import 'package:novindus_task/core/theme/theme.dart';
import 'package:novindus_task/features/auth/repository/auth_local_repository.dart';
import 'package:novindus_task/features/auth/repository/auth_remote_repository.dart';
import 'package:novindus_task/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:novindus_task/features/home/repository/home_repository.dart';
import 'package:novindus_task/features/home/viewmodel/home_viewmodel.dart';
import 'package:novindus_task/features/splash/view/pages/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(
              authLocalRepository: AuthLocalRepository(),
              authRemoteRepository: AuthRemoteRepository()),
          child: const MyApp(),
        ),
        ChangeNotifierProvider(
          create: (_) => CurrentUserNotifier(),
        ),
         ChangeNotifierProvider(
          create: (_) => HomeViewModel(homeRepository: HomeRepository()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightThemeMode,
      home: const SplashScreen(),
    );
  }
}
