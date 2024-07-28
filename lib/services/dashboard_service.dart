import 'dart:convert';

import 'package:e_shop/models/models.dart';
import 'package:e_shop/repositories/repositories.dart';
import 'package:e_shop/utils/utils.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DashboardService {
  DashboardService(this._repository);

  final DashboardRepository _repository;

  Future<List<ProductModel>> getProducts() async {
    try {
      final res = await _repository.getProducts();

      if (res.hasError) {
        throw AppExceptions('Error Fetching', 'Unknown error occured while loading products');
      }

      if (res.statusCode == 204) {
        return [];
      }

      final data = (jsonDecode(res.data) as Map<String, dynamic>)['products'] as List;
      return data.map((e) => ProductModel.fromMap(e as Map<String, dynamic>)).toList();
    } catch (e) {
      throw AppExceptions('Unexpected error occurred', e.toString());
    }
  }
}
