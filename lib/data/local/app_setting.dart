import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unsplash_viewer_flutter/data/model/photo.dart';

part 'app_setting.freezed.dart';

enum HomeImageType { thumb, small }

extension HomeImageTypeExt on HomeImageType {
  static final widths = {
    HomeImageType.thumb: 200.0,
    HomeImageType.small: 400.0,
  };

  double get width => widths[this]!;
  String? getUrl(PhotoUrls urls) {
    switch (this) {
      case HomeImageType.thumb:
        return urls.thumb;
      case HomeImageType.small:
        return urls.small;
    }
  }
}

@freezed
abstract class AppSetting with _$AppSetting {
  factory AppSetting({
    @Default('thumb') String homeImageType,
  }) = _AppSetting;
}
