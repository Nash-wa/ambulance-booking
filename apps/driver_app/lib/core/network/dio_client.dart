import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../storage/local_storage.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.rescuelink-ambulance.com', // placeholder production API base
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final localStorage = ref.read(localStorageProvider);
        final token = localStorage.getToken();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ),
  );

  // Add a logger interceptor in debug mode
  dio.interceptors.add(LogInterceptor(
    requestHeader: false,
    responseHeader: false,
    requestBody: true,
    responseBody: true,
  ));

  return dio;
});
