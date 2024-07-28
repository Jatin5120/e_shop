import 'package:e_shop/res/res.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DbClient {
  Future<void> initialize() async {
    await Hive.initFlutter();
    await Future.wait([
      Hive.openBox(AppConstants.boxName),
    ]);
  }

  Box get _box => Hive.box(AppConstants.boxName);

  T get<T>(
    String key, {
    T? defaultValue,
  }) =>
      _box.get(
        key,
        defaultValue: defaultValue,
      ) as T;

  Future<void> save<T>(String key, T value) => _box.put(key, value);

  Future<void> delete(String key) => _box.delete(key);

  Future<void> clear() => _box.clear();
}
