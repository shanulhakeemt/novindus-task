import 'package:flutter/material.dart';
import 'package:novindus_task/core/utils.dart';
import 'package:novindus_task/features/home/models/patient_model.dart';
import 'package:novindus_task/features/home/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepository _homeRepository;

  bool _isLoading = false;
  List<PatientModel> _patientModels = [];
  List<PatientModel> _allPatientModels = [];

  bool get isLoading => _isLoading;
  List<PatientModel> get patientModels => _patientModels;
  bool _isBottomLoading = false;
  bool get isBottomLoading => _isBottomLoading;
  int _pageSize = 1;

  HomeViewModel({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository;

  Future<void> getPatientList(
      {required String token, required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();

    final res = await _homeRepository.getPatientList(token: token);
    res.fold(
      (l) => showSnackBar(context, l.message),
      (patientModels) {
        _allPatientModels = patientModels;
        getPageinatedPatientList();
        notifyListeners();
      },
    );
    _isLoading = false;
    notifyListeners();
  }

  getPageinatedPatientList() async {
    _isBottomLoading = true;
    notifyListeners();

    if (_patientModels.isNotEmpty) {
      await Future.delayed(const Duration(milliseconds: 1500));
    }
    _patientModels = _patientModels +
        _allPatientModels.sublist(_patientModels.length, _pageSize * 10);
    _pageSize++;
    _isBottomLoading = false;
    notifyListeners();
  }
}
