import 'package:e_shop/models/models.dart';
import 'package:e_shop/services/services.dart';
import 'package:e_shop/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthProvider with ChangeNotifier {
  AuthProvider(this._authService);
  final AuthService _authService;

  User? _user;

  User? get user => _user;

  var emailTEC = TextEditingController();
  var nameTEC = TextEditingController();
  var passwordTEC = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();

  bool get _isLoginValidated => loginFormKey.currentState?.validate() ?? false;

  bool get _isSignupValidated => signupFormKey.currentState?.validate() ?? false;

  void goToLogin() {
    emailTEC.clear();
    nameTEC.clear();
    passwordTEC.clear();
    loginFormKey.currentState?.reset();
    RouteManagement.goToLogin();
  }

  void goToSignup() {
    emailTEC.clear();
    nameTEC.clear();
    passwordTEC.clear();
    signupFormKey.currentState?.reset();
    RouteManagement.goToSignup();
  }

  Future<void> signup() async {
    try {
      if (!_isSignupValidated) {
        return;
      }
      Utility.showLoader();
      await _authService.signup(
        nameTEC.text.trim(),
        emailTEC.text.trim(),
        passwordTEC.text.trim(),
      );
      Utility.closeLoader();
      _user = _authService.getCurrentUser();
      if (_user != null) {
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
      await _authService.login(
        emailTEC.text.trim(),
        passwordTEC.text.trim(),
      );
      Utility.closeLoader();
      _user = _authService.getCurrentUser();
      if (_user != null) {
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
      await _authService.logOut();
      Utility.closeLoader();
      _user = null;
      notifyListeners();
    } on AppExceptions catch (e) {
      Utility.closeLoader();
      await Utility.showInfoDialog(DialogModel.error(e.message));
    }
  }

  void checkCurrentUser() {
    _user = _authService.getCurrentUser();
    notifyListeners();
  }
}
