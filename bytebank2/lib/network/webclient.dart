import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/logging_interceptor.dart';

class WebClient {
  final Client client = HttpClientWithInterceptor.build(interceptors: [
    LoggingInterceptor(),
  ]);
}
