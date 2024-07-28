import 'package:e_shop/models/models.dart';
import 'package:e_shop/services/services.dart';
import 'package:e_shop/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DashboardProvider with ChangeNotifier {
  DashboardProvider(this._service);
  final DashboardService _service;

  var isLoading = true;

  var products = <ProductModel>[];

  void getProducts() async {
    try {
      isLoading = true;
      notifyListeners();
      products = await _service.getProducts();
      isLoading = false;
      notifyListeners();
    } on AppExceptions catch (e) {
      isLoading = false;
      notifyListeners();
      await Utility.showInfoDialog(DialogModel.error(e.details ?? '', e.message));
    }
  }
}
