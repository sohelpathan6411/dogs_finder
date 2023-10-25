import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dogs_finder/core/consts/api_consts.dart';

import '../network/network_check_service.dart';

enum Method { post, get, put, delete, patch }

class DioClient with NetworkCheckService {
  late Dio dio;

  static header() => {
        'Content-Type': 'application/json',
      };

  init() {
    dio = Dio(BaseOptions(baseUrl: baseUrl, headers: header()));

    initInterceptors();
    return this;
  }

  void initInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (err, handler) {
      return handler.next(err);
    }));
  }

  Future<Either<Response, Exception>> request(String url, Method method,
      {Map<String, dynamic>? params}) async {
    Response response;

    try {
      if (method == Method.post) {
        response = await dio.post(url, data: params);
      } else if (method == Method.put) {
        response = await dio.put(url, data: params);
      } else if (method == Method.delete) {
        response = await dio.delete(url);
      } else if (method == Method.patch) {
        response = await dio.patch(url, data: params);
      } else {
        response = await dio.get(
          url,
          queryParameters: params,
        );
      }

      if (response.statusCode == 200) {
        return Left(response);
      } else if (response.statusCode == 401) {
        throw Right(Exception("Unauthorized"));
      } else if (response.statusCode == 500) {
        throw Right(Exception("Server Error"));
      } else {
        throw Right(Exception("Something Went Wrong"));
      }
    } on SocketException {
      throw Right(Exception("No Internet Connection"));
    } on FormatException {
      throw Right(Exception("Bad Response Format!"));
    } on DioException catch (e) {
      throw Right(Exception(e));
    } catch (e) {
      throw Right(Exception("Something Went Wrong"));
    }
  }
}
