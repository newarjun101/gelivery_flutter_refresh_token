
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:refresh_token_flutter/utils/db_constants.dart';

import '../core/logout_helper.dart';
import '../core/preference_helper.dart';
import '../utils/api_constants.dart';

part 'app_exception.dart';

class ApiBaseHelper extends Interceptor {
  Dio dioClient =
  Dio(BaseOptions(baseUrl: ApiConstants.nBaseUrl, connectTimeout: 10000));

   PreferencesHelper authService =PreferencesHelper();



  ApiBaseHelper() {

    dioClient.interceptors
        .add(QueuedInterceptorsWrapper(onRequest: (options, handler) {

      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      return handler.next(response); // continue
    }, onError: (DioError err, handler) async {
      //debugPrint("status code ${err.response?.statusCode}");
      switch (err.type) {
        case DioErrorType.connectTimeout:
          break;
        case DioErrorType.sendTimeout:
          break;
        case DioErrorType.receiveTimeout:
          break;
        case DioErrorType.response:
          switch (err.response?.statusCode) {
            case 400:
            //throw BadRequestException(err.requestOptions);
              break;
            case 401:
              debugPrint("refresh response message from 401 is ${err.response?.data}");
              if (err.response?.data['message'] == "Not authenticated") {
                debugPrint("if refresh response message from 401 is ${err.response?.data}");
                refreshToken(err.requestOptions, handler);
                return;
              }  else {
                debugPrint("else refresh response message from 401 is ${err.response?.data}");
              }
              break;
            case 404:
            //throw NotFoundException(err.requestOptions);
              break;
            case 409:
              break;
          //throw ConflictException(err.requestOptions);
            case 500:
              break;
          //throw InternalServerErrorException(err.requestOptions);
          }
          break;
        case DioErrorType.cancel:
          break;
        case DioErrorType.other:
          break;
      }

      return handler.next(err);
    }));
  }

  Future<dynamic> _retry(RequestOptions requestOptions) async {
    debugPrint("retrying");

    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dioClient.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  // get method for api call
  Future<dynamic> get(String uri) async {
    debugPrint("get request uri"+uri);
    dynamic responseJson;
    try {
      var response = await dioClient.get(uri);
      responseJson = _returnResponse(response);
    } on DioError catch (e) {
      debugPrint(e.toString());
      responseJson = _returnResponse(e.response);
    }
    return responseJson;
  }

  Future<void> refreshToken(
      RequestOptions req, ErrorInterceptorHandler handler) async {
    debugPrint("refresh token is called");
    try {
      Options options = Options(headers: {"Content-Type": "application/json"});

      String token = await PreferencesHelper().getString(prefRefreshToken);
      var response = await Dio().post(
          "${ApiConstants.nBaseUrl}${ApiConstants.nRefreshTokenEndPoint}",
          data: {'accessToken': token},
          options: options);

      if (response.statusCode == 200) {

        print("arjun ${response.data}");
        authService.onSaveToken(response.data);
        var retryResponse = await _retry(req);
        handler.resolve(retryResponse);
      }
    } on DioError catch (e) {
      debugPrint("error is calling");
      if (e.response?.statusCode == 401) {
         LogoutHelper().onLogout();
      } else {
        LogoutHelper().onLogout();
        throw Exception(e.message);
      }
    }
  }

  Future<dynamic> getWithHeader(String uri, Options header) async {
    dynamic responseJson;
    try {
      var response = await dioClient.get(uri, options: header);
      //Options(headers: {"noToken": "false", "userId": value});
      responseJson = _returnResponse(response);
    } on DioError catch (e) {
      responseJson = _returnResponse(e.response);
    }
    return responseJson;
  }

  // post method for api call both header and without header
  Future<dynamic> post(String uri, var body,[ bool isRequiredToken =false]) async {
    dynamic responseJson;
    String token = await authService.getString(prefAccessToken);
    try {
      Options options =
      Options(headers: isRequiredToken ? {"Authorization": "Bearer $token"} : {});

      var response = await dioClient.post(uri, data: body, options: options);
      responseJson = _returnResponse(response);
    } on DioError catch (e) {
      responseJson = _returnResponse(e.response);
    }
    return responseJson;
  }

  // handing different response
  dynamic _returnResponse(var response) {
    if (response != null) {
      switch (response.statusCode) {
        case 200:
          var responseJson = response.data;
          return responseJson;
        case 201:
          var responseJson = response.data;
          return responseJson;
        case 400:
          throw BadRequestException(response.statusMessage);
        case 401:

        case 403:
          throw UnauthorisedException(response.statusMessage);

        default:
          throw FetchDataException(
              'No Internet ');
      }
    } else {
      throw FetchDataException("No Internet");
    }
  }
}
