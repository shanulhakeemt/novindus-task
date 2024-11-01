import 'package:flutter/material.dart';
import 'package:novindus_task/core/constants/asset_constants.dart';
import 'package:novindus_task/core/utils.dart';
import 'package:novindus_task/features/auth/view/pages/screen_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkLocalStorage() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      navigate(
          context: context,
          screen: const ScreenLogin(),
          type: NavigationType.pushAndRemoveUntil);
    }
  }

  @override
  void initState() {
    checkLocalStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
      child: Image.asset(
        AssetConstants.splashImg,
        fit: BoxFit.cover,
      ),
    ));
  }
}
