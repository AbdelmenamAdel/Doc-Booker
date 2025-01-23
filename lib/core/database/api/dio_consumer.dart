import 'package:dio/dio.dart';

import '../../error/error_model.dart';
import '../../error/exception.dart';
import 'api_consumer.dart';
import 'api_interceptors.dart';
import 'end_points.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer(this.dio) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.options.contentType = Headers.jsonContentType;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true));
  }
  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic data, Map<String, dynamic>? queryParameters,bool isFormData=false,}) async {
    try {
      var res = await dio.patch(
        path,
        data:isFormData?FormData.fromMap(data): data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData=false,
  }) async {
    try {
      var res = await dio.post(
        path,
        data:isFormData?FormData.fromMap(data): data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  handleDioException(e) {
    switch (e.type) {
      case DioExceptionType.connectionError:
        throw ConnectionErrorException(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.badCertificate:
        throw BadCertificateException(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.connectionTimeout:
        throw ConnectionTimeoutException(ErrorModel.fromJson(e.response!.data));

      case DioExceptionType.receiveTimeout:
        throw ReceiveTimeoutException(ErrorModel.fromJson(e.response!.data));

      case DioExceptionType.sendTimeout:
        throw SendTimeoutException(ErrorModel.fromJson(e.response!.data));
      // throw ServerException('connection Error');

      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 400: // Bad request

            throw BadResponseException(ErrorModel.fromJson(e.response!.data));

          case 401: //unauthorized
            throw UnauthorizedException(ErrorModel.fromJson(e.response!.data));

          case 403: //forbidden
            throw ForbiddenException(ErrorModel.fromJson(e.response!.data));

          case 404: //not found
            throw NotFoundException(ErrorModel.fromJson(e.response!.data));

          case 409: //cofficient
            // throw ServerException('badResponse');
            throw CofficientException(ErrorModel.fromJson(e.response!.data));

          case 504: // Bad request

            throw BadResponseException(ErrorModel.fromJson(e.response!.data));
        }

      case DioExceptionType.cancel:
        throw CancelException(
            ErrorModel(errorMessage: e.toString(), status: 500));

      case DioExceptionType.unknown:
        throw UnknownException(
            ErrorModel(errorMessage: e.toString(), status: 500));
      // throw ServerException('badResponse');
    }
  }
}
