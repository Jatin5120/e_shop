import 'dart:async';

import 'package:e_shop/data/data.dart';
import 'package:e_shop/di/di.dart';
import 'package:e_shop/models/models.dart';
import 'package:e_shop/services/services.dart';
import 'package:e_shop/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthProvider with ChangeNotifier {
  AuthProvider(this._service);
  final AuthService _service;

  User? _user;

  User? get user => _user;

  var emailTEC = TextEditingController();
  var nameTEC = TextEditingController();
  var passwordTEC = TextEditingController();

  var showPassword = false;

  final loginFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();

  bool get _isLoginValidated => loginFormKey.currentState?.validate() ?? false;

  bool get _isSignupValidated => signupFormKey.currentState?.validate() ?? false;

  void _clearFields() {
    emailTEC.clear();
    nameTEC.clear();
    passwordTEC.clear();
    showPassword = false;
  }

  void goToLogin() {
    _clearFields();
    loginFormKey.currentState?.reset();
    RouteManagement.goToLogin();
  }

  void goToSignup() {
    _clearFields();
    signupFormKey.currentState?.reset();
    RouteManagement.goToSignup();
  }

  void togglePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }

  Future<void> signup() async {
    try {
      if (!_isSignupValidated) {
        return;
      }
      Utility.showLoader();
      await _service.signup(
        nameTEC.text.trim(),
        emailTEC.text.trim(),
        passwordTEC.text.trim(),
      );
      Utility.closeLoader();
      _user = _service.getCurrentUser();
      if (_user != null) {
        _clearFields();
        unawaited(kGetIt<DbClient>().save(LocalKeys.isLoggedIn, true));
        RouteManagement.goToDashboard();
      }
      notifyListeners();
    } on AppExceptions catch (e) {
      Utility.closeLoader();
      await Utility.showInfoDialog(DialogModel.error(e.details ?? '', e.message));
    }
  }

  Future<void> login() async {
    try {
      if (!_isLoginValidated) {
        return;
      }
      Utility.showLoader();
      await _service.login(
        emailTEC.text.trim(),
        passwordTEC.text.trim(),
      );
      Utility.closeLoader();
      _user = _service.getCurrentUser();
      if (_user != null) {
        unawaited(kGetIt<DbClient>().save(LocalKeys.isLoggedIn, true));
        _clearFields();
        RouteManagement.goToDashboard();
      }
      notifyListeners();
    } on AppExceptions catch (e) {
      Utility.closeLoader();
      await Utility.showInfoDialog(DialogModel.error(e.details ?? '', e.message));
    }
  }

  Future<void> logOut() async {
    try {
      Utility.showLoader();
      await _service.logOut();
      unawaited(kGetIt<DbClient>().save(LocalKeys.isLoggedIn, false));
      Utility.closeLoader();
      RouteManagement.goToLogin();
      _user = null;
      notifyListeners();
    } on AppExceptions catch (e) {
      Utility.closeLoader();
      await Utility.showInfoDialog(DialogModel.error(e.message));
    }
  }

  void checkCurrentUser() {
    _user = _service.getCurrentUser();
    notifyListeners();
  }
}
