part of 'network.dart';

class NetworkInfoInterceptor extends InterceptorsWrapper {
  final NetworkInfo networkInfo;

  NetworkInfoInterceptor({required this.networkInfo});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final isConnected = await networkInfo.isConnected;

    if (!isConnected) {
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.unknown,
          error: NetworkException(
            code: 'NO_CONNECTION',
            message: 'No internet connection. Please check your network.',
          ),
        ),
      );
    }
    super.onRequest(options, handler);
  }
}
