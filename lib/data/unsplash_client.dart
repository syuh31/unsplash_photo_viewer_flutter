import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ua_client_hints/ua_client_hints.dart';
import 'package:unsplash_viewer_flutter/foundation/constants.dart';

final unsplashClientProvider = Provider((_) => UnsplashClient.getInstance());

// ignore: prefer_mixin
class UnsplashClient with DioMixin implements Dio {
  UnsplashClient._([BaseOptions? options]) {
    final constants = Constants.of();

    options = BaseOptions(
      baseUrl: constants.endpoint,
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
      headers: <String, dynamic>{
        'Accept-Version': 'v1',
        'Authorization': 'Client-ID ${constants.apiKey}'
      },
    );

    this.options = options;
    interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.headers.addAll(await userAgentClientHintsHeader());
      handler.next(options);
    }));

    // Firebase Performance
    // interceptors.add(DioFirebasePerformanceInterceptor());

    if (kDebugMode) {
      // Local Log
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance() => UnsplashClient._();
}
