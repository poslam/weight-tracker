// ignore_for_file: empty_catches

import 'dart:async';

import 'package:chopper/chopper.dart';

import '../../../logger/event.dart';
import '../../../logger/logger.dart';

class RequestLoggerInterceptor implements RequestInterceptor {
  RequestLoggerInterceptor();

  @override
  FutureOr<Request> onRequest(Request request) async {
    try {
      final LoggerEvent message = LoggerEvent(
        request.url.toString(),
        {
          "method": request.method,
          "headers": request.headers.toString(),
          "body": request.body.toString(),
          "query": request.parameters.toString(),
        },
      );

      AppLogger.api(message);
    } catch (e) {}
    return request;
  }
}

class ResponseLoggerInterceptor implements ResponseInterceptor {
  ResponseLoggerInterceptor();

  @override
  FutureOr<Response> onResponse(Response response) async {
    try {
      final LoggerEvent message = LoggerEvent(
        response.base.request?.url.toString() ?? "",
        {
          "method": response.base.request?.method ?? "",
          "body": response.body.toString(),
          "statusCode": response.statusCode.toString(),
        },
      );

      AppLogger.api(message);
    } catch (e) {}
    return response;
  }
}
