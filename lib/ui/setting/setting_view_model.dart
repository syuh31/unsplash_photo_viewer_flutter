import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:unsplash_viewer_flutter/data/local/app_setting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingViewModelProvider =
    ChangeNotifierProvider((_) => SettingViewModel());

class SettingViewModel extends ChangeNotifier {
  var _setting = AppSetting();

  HomeImageType get homeImageType =>
      EnumToString.fromString(HomeImageType.values, _setting.homeImageType)!;

  set homeImageType(HomeImageType value) {
    _setting = _setting.copyWith(homeImageType: EnumToString.convertToString(value));
    notifyListeners();
  }
}
