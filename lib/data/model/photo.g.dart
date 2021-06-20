// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhotoUrls _$_$_PhotoUrlsFromJson(Map<String, dynamic> json) {
  return _$_PhotoUrls(
    raw: json['raw'] as String?,
    full: json['full'] as String?,
    regular: json['regular'] as String?,
    small: json['small'] as String?,
    thumb: json['thumb'] as String?,
  );
}

Map<String, dynamic> _$_$_PhotoUrlsToJson(_$_PhotoUrls instance) =>
    <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'regular': instance.regular,
      'small': instance.small,
      'thumb': instance.thumb,
    };

_$_Photo _$_$_PhotoFromJson(Map<String, dynamic> json) {
  return _$_Photo(
    id: json['id'] as String,
    urls: PhotoUrls.fromJson(json['urls'] as Map<String, dynamic>),
    width: json['width'] as int,
    height: json['height'] as int,
  );
}

Map<String, dynamic> _$_$_PhotoToJson(_$_Photo instance) => <String, dynamic>{
      'id': instance.id,
      'urls': instance.urls,
      'width': instance.width,
      'height': instance.height,
    };
