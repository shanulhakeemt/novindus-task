import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:novindus_task/core/constants/server_constants.dart';
import 'package:novindus_task/core/failure/failure.dart';
import 'package:http/http.dart' as http;
import 'package:novindus_task/features/auth/models/user_model.dart';

class AuthRemoteRepository {
  Future<Either<AppFailure, UserModel>> login(
      {required String username, required String password}) async {
    try {
      final formData = {
        'username': username,
        'password': password,
      };

      final res = await http.post(
        Uri.parse("${ServerConstants.serverUrl}Login"),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: formData,
      );
      final resBodyMap = jsonDecode(res.body);

      if (res.statusCode == 200 && resBodyMap['status'] == true) {
        final userModel = UserModel.fromMap(resBodyMap['user_details'])
            .copyWith(token: resBodyMap['token']);
        return right(userModel);
      } else if (res.statusCode == 200 && resBodyMap['status'] == false) {
        return left(AppFailure(resBodyMap['message']));
      } else if (res.statusCode == 404) {
        return left(AppFailure('Bad request'));
      } else {
        return left(AppFailure('An Unexpected error occured'));
      }
    } catch (e) {
      return left(AppFailure(e.toString()));
    }
  }
}
