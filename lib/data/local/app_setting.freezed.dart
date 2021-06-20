// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppSettingTearOff {
  const _$AppSettingTearOff();

  _AppSetting call({String homeImageType = 'thumb'}) {
    return _AppSetting(
      homeImageType: homeImageType,
    );
  }
}

/// @nodoc
const $AppSetting = _$AppSettingTearOff();

/// @nodoc
mixin _$AppSetting {
  String get homeImageType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppSettingCopyWith<AppSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingCopyWith<$Res> {
  factory $AppSettingCopyWith(
          AppSetting value, $Res Function(AppSetting) then) =
      _$AppSettingCopyWithImpl<$Res>;
  $Res call({String homeImageType});
}

/// @nodoc
class _$AppSettingCopyWithImpl<$Res> implements $AppSettingCopyWith<$Res> {
  _$AppSettingCopyWithImpl(this._value, this._then);

  final AppSetting _value;
  // ignore: unused_field
  final $Res Function(AppSetting) _then;

  @override
  $Res call({
    Object? homeImageType = freezed,
  }) {
    return _then(_value.copyWith(
      homeImageType: homeImageType == freezed
          ? _value.homeImageType
          : homeImageType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AppSettingCopyWith<$Res> implements $AppSettingCopyWith<$Res> {
  factory _$AppSettingCopyWith(
          _AppSetting value, $Res Function(_AppSetting) then) =
      __$AppSettingCopyWithImpl<$Res>;
  @override
  $Res call({String homeImageType});
}

/// @nodoc
class __$AppSettingCopyWithImpl<$Res> extends _$AppSettingCopyWithImpl<$Res>
    implements _$AppSettingCopyWith<$Res> {
  __$AppSettingCopyWithImpl(
      _AppSetting _value, $Res Function(_AppSetting) _then)
      : super(_value, (v) => _then(v as _AppSetting));

  @override
  _AppSetting get _value => super._value as _AppSetting;

  @override
  $Res call({
    Object? homeImageType = freezed,
  }) {
    return _then(_AppSetting(
      homeImageType: homeImageType == freezed
          ? _value.homeImageType
          : homeImageType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AppSetting implements _AppSetting {
  _$_AppSetting({this.homeImageType = 'thumb'});

  @JsonKey(defaultValue: 'thumb')
  @override
  final String homeImageType;

  @override
  String toString() {
    return 'AppSetting(homeImageType: $homeImageType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppSetting &&
            (identical(other.homeImageType, homeImageType) ||
                const DeepCollectionEquality()
                    .equals(other.homeImageType, homeImageType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(homeImageType);

  @JsonKey(ignore: true)
  @override
  _$AppSettingCopyWith<_AppSetting> get copyWith =>
      __$AppSettingCopyWithImpl<_AppSetting>(this, _$identity);
}

abstract class _AppSetting implements AppSetting {
  factory _AppSetting({String homeImageType}) = _$_AppSetting;

  @override
  String get homeImageType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppSettingCopyWith<_AppSetting> get copyWith =>
      throw _privateConstructorUsedError;
}
