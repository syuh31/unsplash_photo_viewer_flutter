import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
abstract class PhotoUrls with _$PhotoUrls {
  factory PhotoUrls({
    String? raw,
    String? full,
    String? regular,
    String? small,
    String? thumb,
  }) = _PhotoUrls;

  factory PhotoUrls.fromJson(Map<String, dynamic> json) =>
      _$PhotoUrlsFromJson(json);
}

@freezed
abstract class Photo with _$Photo {
  factory Photo({
    required String id,
    required PhotoUrls urls,
    required int width,
    required int height,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
