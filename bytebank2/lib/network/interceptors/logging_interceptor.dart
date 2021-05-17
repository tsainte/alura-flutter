import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    debugPrint("---- Request ----");
    debugPrint("url: ${data.url}");
    debugPrint("headers: ${data.headers}");
    debugPrint("body: ${data.body}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    debugPrint("---- Response ----");
    debugPrint("url: ${data.url}");
    debugPrint("status code: ${data.statusCode}");
    debugPrint("body: ${data.body}");
    return data;
  }
}
