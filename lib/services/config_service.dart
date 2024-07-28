import 'dart:async';

import 'package:e_shop/utils/utils.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> setDefaults() async {
    try {
      await Future.wait([
        _remoteConfig.setDefaults({
          'showDiscountPrice': true,
        }),
        _remoteConfig.setConfigSettings(
          RemoteConfigSettings(
            fetchTimeout: const Duration(seconds: 30),
            minimumFetchInterval: const Duration(seconds: 10),
          ),
        ),
      ]);
      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      throw AppExceptions('Failed to fetch remote config', e.toString());
    }
  }

  bool get showDiscountPrice => _remoteConfig.getBool('showDiscountPrice');
}
