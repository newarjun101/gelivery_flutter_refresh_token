/*
import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:refresh_token_flutter/core/logout_helper.dart';
import 'package:refresh_token_flutter/core/preference_helper.dart';

import '../main.dart';
import '../utils/api_constants.dart';

part 'app_exception.dart';

class ApiBaseHelper extends Interceptor {
  Dio dioClient = Dio(BaseOptions(
      baseUrl: ApiConstants.nBaseUrl,
      connectTimeout: const Duration(seconds: 10)));

  PreferencesHelper authService = PreferencesHelper();

  String token = "";

  Future onGetToken() async {
    String jsonToken = await authService.getString("token");
    if (jsonToken.isNotEmpty) {
      token = jsonDecode(jsonToken)["access_token"];
    }
    print(token);
    return token;
  }

  ApiBaseHelper() {
    //apibase helper
    onGetToken().then((value){
      dioClient.interceptors
          .add(QueuedInterceptorsWrapper(onRequest: (options, handler) {
        if (options.headers.containsKey("noToken")) {
          //options.headers.remove("noToken");
        } else {
          options.headers.addAll({
            "x-access-token": token,
            "Content-Type": "application/json",
            "Accept": "application/json"
          });
        }

        return handler.next(options); //continue
      }, onResponse: (response, handler) {
        return handler.next(response); // continue
      }, onError: (DioException err, handler) async {
        //debugPrint("status code ${err.response?.statusCode}");
        switch (err.type) {
          case DioException.connectionTimeout:
            throw TimeoutException(err.message);
            break;
          case DioException.sendTimeout:
            throw TimeoutException(err.message);
            break;
          case DioException.receiveTimeout:
            break;
          case DioException.requestCancelled:
            break;
          case DioException.connectionError:
            break;
          case DioExceptionType.connectionTimeout:
            break;
          case DioExceptionType.sendTimeout:
            break;
          case DioExceptionType.receiveTimeout:
            break;
          case DioExceptionType.badCertificate:
            break;
          case DioExceptionType.badResponse:
            switch (err.response?.statusCode) {
              case 400:
                throw BadRequestException("${err.message}");
                break;
              case 401:
                debugPrint("response message from 401 is ${err.response?.data}");
                if (err.response?.data['message'] != "Refresh token success") {
                  if(token.isNotEmpty) {
                    refreshToken(err.requestOptions, handler);
                  }
                } else if (err.response?.data['msg'] == "Bad credentials!" ||
                    err.response?.data['error'] == "Bad Request") {
                  if(token.isNotEmpty) {
                    refreshToken(err.requestOptions, handler);
                  }
                }
                throw BadRequestException("${err.message}");
                break;
              case 404:
                throw BadRequestException("${err.message}");
                break;
              case 409:
                throw BadRequestException("${err.message}");
                break;

              case 500:
                throw BadRequestException("${err.message}");
                break;

            }
            break;
          case DioExceptionType.cancel:
            break;
          case DioExceptionType.connectionError:
            break;
          case DioExceptionType.unknown:
            break;
        }

        return handler.next(err);
      }));
    });



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
    debugPrint("get request uri" + uri);
    dynamic responseJson;
    try {
      var response = await dioClient.get(uri);
      responseJson = _returnResponse(response);
    } on DioException catch (e) {
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

      String myToken = await authService.getString("token");
      var response = await Dio().post(
          "${ApiConstants.nBaseUrl}${ApiConstants.nRefreshTokenEndPoint}",
          data: {'accessToken': jsonDecode(myToken)["refresh_token"]},
          options: options);

      if (response.statusCode == 200) {
        await authService.setString(
            "token",
            jsonEncode({
              "access_token": response.data["data"]["access_token"],
              "refresh_token": response.data["data"]["refresh_token"],
              "expires": response.data['data']["expires_in"]
            }));

        token = response.data['access_token'];
        var retryResponse = await _retry(req);
        handler.resolve(retryResponse);
      }
    } on DioException catch (e) {
      debugPrint("error is calling");
      if (e.response?.statusCode == 401) {

        LogoutHelper().onLogout();
      } else {
        debugPrint("something");
      }
    }
  }

  Future<dynamic> getWithHeader(String uri, Options header) async {
    dynamic responseJson;
    try {
      var response = await dioClient.get(uri, options: header);
      //Options(headers: {"noToken": "false", "userId": value});
      responseJson = _returnResponse(response);
    } on DioException catch (e) {
      responseJson = _returnResponse(e.response);
    }
    return responseJson;
  }

  // post method for api call both header and without header
  Future<dynamic> post(String uri, var body,
      [bool isRequiredToken = false]) async {
    dynamic responseJson;

    print("token $isRequiredToken $token");
    try {
      Options options = Options(
          headers: isRequiredToken ? {"Authorization": "Bearer $token"} : {});
      var response = await dioClient.post(uri, data: body, options: options);
      responseJson = _returnResponse(response);
    } on DioException catch (e) {
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
          throw UnauthorisedException(response.statusMessage);
        case 403:
          throw UnauthorisedException(response.statusMessage);
        case 500:
          throw UnauthorisedException(response.statusMessage);
        default:
          throw FetchDataException('No Internet ');
      }
    } else {
      throw FetchDataException("No Internet");
    }
  }
}
*/
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