import 'dart:convert';

import 'package:e_shop/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class DashboardRepository {
  Future<ResponseModel> getProducts() async {
    final url = Uri.parse('https://dummyjson.com/products');
    final res = await http.get(url);

    return switch (res.statusCode) {
      200 || 201 || 202 || 204 => ResponseModel(
          data: utf8.decode(res.bodyBytes),
          hasError: false,
          statusCode: res.statusCode,
        ),
      _ => ResponseModel(
          data: utf8.decode(res.bodyBytes),
          hasError: true,
          statusCode: res.statusCode,
        ),
    };
  }
}
