import 'dart:io';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

void handleUserAPIError(
    DioError err, ErrorInterceptorHandler handler, Dio dio) async {
  switch (err.type) {
    case DioErrorType.connectTimeout:
      handler.resolve(Response(
          data: 'connect timeout error', requestOptions: err.requestOptions));
      break;
    case DioErrorType.sendTimeout:
      handler.resolve(Response(
          data: 'sending data is slow', requestOptions: err.requestOptions));
      break;
    case DioErrorType.receiveTimeout:
      handler.resolve(Response(
          data: 'receiving data is slow', requestOptions: err.requestOptions));
      break;
    case DioErrorType.response:
      handler.resolve(err.response ??
          Response(data: 'response error', requestOptions: err.requestOptions));
      break;
    case DioErrorType.cancel:
      handler.resolve(Response(
          data: 'user cancelled request', requestOptions: err.requestOptions));
      break;
    case DioErrorType.other:
      if (err.error is SocketException) {
        await socketExceptionErrorDialog(err, handler, dio);
      } else {
        handler.resolve(
            Response(data: 'other error', requestOptions: err.requestOptions));
      }
      break;
  }
}

Future<void> socketExceptionErrorDialog(
  DioError err,
  ErrorInterceptorHandler handler,
  Dio dio,
) async {
  getx.Get.defaultDialog(
      title: 'No Internet Connection',
      middleText: 'Please check your internet connection and try again',
      barrierDismissible: false,
      confirm: ElevatedButton(
        onPressed: () async {
          getx.Get.back();
          var result = await dio.request(err.requestOptions.path,
              data: err.requestOptions.data,
              options: Options(
                method: err.requestOptions.method,
                contentType: err.requestOptions.contentType,
                headers: err.requestOptions.headers,
                responseType: err.requestOptions.responseType,
                followRedirects: err.requestOptions.followRedirects,
                validateStatus: err.requestOptions.validateStatus,
                receiveDataWhenStatusError:
                    err.requestOptions.receiveDataWhenStatusError,
                extra: err.requestOptions.extra,
                responseDecoder: err.requestOptions.responseDecoder,
                listFormat: err.requestOptions.listFormat,
                maxRedirects: err.requestOptions.maxRedirects,
                receiveTimeout: err.requestOptions.receiveTimeout,
                sendTimeout: err.requestOptions.sendTimeout,
                requestEncoder: err.requestOptions.requestEncoder,
              ));
          handler.resolve(result);
        },
        child: const Text('Retry'),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          getx.Get.back();
          handler.resolve(Response(
              data: 'socket exception', requestOptions: err.requestOptions));
        },
        child: const Text('Cancel'),
      ));
}
