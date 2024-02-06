import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widget_tester/core/providers/dio_provioder.dart';

part 'api_client.g.dart';

@riverpod
ApiClient apiClient(ApiClientRef ref) {
  return ApiClient(
    dio: ref.read(dioAppProvider),
  );
}

class ApiClient {
  final Dio dio;
  ApiClient({required this.dio});

  Future<Response<dynamic>> get({required String path}) async {
    return dio.get(path);
  }
}
