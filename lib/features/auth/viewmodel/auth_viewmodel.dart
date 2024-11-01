import 'package:flutter/material.dart';
import 'package:novindus_task/core/notifiers/current_user_notifier.dart';
import 'package:novindus_task/core/utils.dart';
import 'package:novindus_task/features/auth/repository/auth_local_repository.dart';
import 'package:novindus_task/features/auth/repository/auth_remote_repository.dart';
import 'package:novindus_task/features/home/view/pages/screen_home.dart';
import 'package:novindus_task/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRemoteRepository _authRemoteRepository;
  final AuthLocalRepository _authLocalRepository;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  AuthViewModel(
      {required AuthRemoteRepository authRemoteRepository,
      required AuthLocalRepository authLocalRepository})
      : _authLocalRepository = authLocalRepository,
        _authRemoteRepository = authRemoteRepository;

  Future<void> initSharedPreference() async {
    await _authLocalRepository.init();
  }

  Future<void> login(
      {required String username,
      required String password,
      required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();

    final res = await _authRemoteRepository.login(
        username: username, password: password);
    res.fold(
      (l) => showSnackBar(context, l.message),
      (usermodel) async {
        await initSharedPreference();
        _authLocalRepository.setToken(usermodel.token);

        if (context.mounted) {
          Provider.of<CurrentUserNotifier>(context, listen: false)
              .addUser(usermodel);

          navigate(context: context, screen: const ScreenHome());
          showSnackBar(context, "User Succesfully logged");
          Provider.of<HomeViewModel>(context, listen: false)
              .getPatientList(token: usermodel.token, context: context);
        }
      },
    );
    _isLoading = false;
    notifyListeners();
  }
}
