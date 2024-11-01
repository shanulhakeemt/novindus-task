import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:novindus_task/core/constants/server_constants.dart';
import 'package:novindus_task/core/failure/failure.dart';
import 'package:http/http.dart' as http;
import 'package:novindus_task/features/home/models/patient_model.dart';

class HomeRepository {
  Future<Either<AppFailure, List<PatientModel>>> getPatientList(
      {required String token}) async {
    try {
      final res = await http.get(
        Uri.parse("${ServerConstants.serverUrl}PatientList"),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': "Bearer $token"
        },
      );
      final resBodyMap = jsonDecode(res.body);

      if (res.statusCode == 200 && resBodyMap['status'] == true) {
        final patentModels = (resBodyMap['patient'] as List)
            .map(
              (e) => PatientModel.fromMap(e),
            )
            .toList();
        return right(patentModels);
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
