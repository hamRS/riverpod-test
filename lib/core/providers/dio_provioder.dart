import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provioder.g.dart';

@riverpod
Dio dioApp(DioAppRef ref) {
  return Dio();
}
