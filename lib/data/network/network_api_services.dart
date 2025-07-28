// import 'dart:async';
// import 'dart:io';
// import 'package:canwinn_project/data/app_exception.dart';
// import 'package:canwinn_project/data/network/base_api_services.dart';
// import 'package:canwinn_project/helper/storage_helper.dart';
// import 'package:dio/dio.dart';

// class NetworkApiServices extends BaseApiServices {
//   Dio dio = Dio();
//   @override
//   Future<dynamic> getGetApiResponse(String url) async {
//     try {
//       Response response = await dio.get(url);
//       return response.data;
//     } on SocketException {
//       return InternetException(message: 'No Internet Connection');
//     } on HttpException {
//       return ServerException(message: 'Server Error');
//     } on RequestTimeoutException {
//       return RequestTimeoutException(message: 'Request Timeout');
//     } catch (e) {
//       return 'Error: $e';
//     }
//   }

//   @override
//   Future<void> postApiResponse(String url, data) async {
//     try {
//       Response response = await dio.post(url);
//     } on SocketException {
//       InternetException(message: 'No Internet Connection');
//     } on HttpException {
//       ServerException(message: 'Server Error');
//     } on RequestTimeoutException {
//       RequestTimeoutException(message: 'Request Timeout');
//     } catch (e) {
//       'Error: $e';
//     }
//   }

//   @override
//   Future getMultipartPostApiResponse(String url, formData) async {
//     try {
//       dio.options.headers["Authorization"] =
//           "Bearer ${StorageHelper.getToken()}";
//       dio.options.contentType = 'multipart/form-data';

//       dio.interceptors.add(
//         LogInterceptor(
//           requestBody: true,
//           responseBody: true,
//           requestHeader: true,
//           error: true,
//         ),
//       );

//       final response = await dio.post(url, data: formData);
//       return returnResponse(response);
//     } on SocketException {
//       throw InternetException(message: 'No Internet Connection');
//     } on TimeoutException {
//       throw RequestTimeoutException(message: 'Request Timeout');
//     } on DioException catch (e) {
//       throw ServerException(message: e.message ?? 'Server Error');
//     } catch (e) {
//       throw AppException(message: 'Unexpected error: $e');
//     }
//   }

//   dynamic returnResponse(Response response) {
//     switch (response.statusCode) {
//       case 200:
//         return response.data;
//       case 201:
//         return response.data;
//       case 400:
//         throw BadRequestException(
//           message: 'Bad Request',
//           code: response.statusCode,
//         );
//       case 401:
//         throw UnauthorizedException(
//           message: 'Unauthorized',
//           code: response.statusCode,
//         );
//       case 404:
//         throw NotFoundException(
//           message: 'Not Found',
//           code: response.statusCode,
//         );
//       default:
//         throw AppException(
//           message: 'Something went wrong',
//           code: response.statusCode,
//         );
//     }
//   }
// }

import 'dart:async';
import 'dart:io';
import 'package:canwinn_project/data/app_exception.dart';
import 'package:canwinn_project/data/network/base_api_services.dart';
import 'package:canwinn_project/helper/storage_helper.dart';
import 'package:dio/dio.dart';

class NetworkApiServices extends BaseApiServices {
  Dio dio = Dio();

  NetworkApiServices() {
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        error: true,
      ),
    );
  }

  @override
  Future<dynamic> getGetApiResponse(String url) async {
    try {
      final response = await dio.get(url);
      return returnResponse(response);
    } on SocketException {
      throw InternetException(message: 'No Internet Connection');
    } on TimeoutException {
      throw RequestTimeoutException(message: 'Request Timeout');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Server Error');
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }

  @override
  Future<dynamic> postApiResponse(String url, dynamic data) async {
    try {
      dio.options.headers["Content-Type"] = "application/json";

      final response = await dio.post(url, data: data);

      return returnResponse(response);
    } on SocketException {
      throw InternetException(message: 'No Internet Connection');
    } on TimeoutException {
      throw RequestTimeoutException(message: 'Request Timeout');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Server Error');
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }

  @override
  Future<dynamic> getMultipartPostApiResponse(
    String url,
    FormData formData,
  ) async {
    try {
      dio.options.headers["Authorization"] =
          "Bearer ${StorageHelper.getToken()}";
      dio.options.contentType = 'multipart/form-data';

      final response = await dio.post(url, data: formData);
      return returnResponse(response);
    } on SocketException {
      throw InternetException(message: 'No Internet Connection');
    } on TimeoutException {
      throw RequestTimeoutException(message: 'Request Timeout');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Server Error');
    } catch (e) {
      throw AppException(message: 'Unexpected error: $e');
    }
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(
          message: 'Bad Request',
          code: response.statusCode,
        );
      case 401:
        throw UnauthorizedException(
          message: 'Unauthorized',
          code: response.statusCode,
        );
      case 404:
        throw NotFoundException(
          message: 'Not Found',
          code: response.statusCode,
        );
      default:
        throw AppException(
          message: 'Something went wrong',
          code: response.statusCode,
        );
    }
  }
}
