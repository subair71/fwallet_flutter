import 'package:dio/dio.dart';
import 'package:mpay/core/infrastructure/network/dio_exception.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    // options.headers['Content-Type'] = 'text/json';
    // options.headers['Accept'] = 'text/json';
    options.connectTimeout = const Duration(seconds: 10);
    options.receiveTimeout = const Duration(seconds: 10);
  }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    if (err.runtimeType == DioException) {
  //      ScaffoldMessenger.of(navigatorKey!.currentContext!,).showSnackBar(
  //   SnackBar(
  //     content: Text(DioCustomException.fromDioError(err.type, err.response!.statusCode??500).errorMessage),

  //     duration: const Duration(seconds: 3),
  //   ),
  // );
      // GlobalWidgets.showAlert(
      //   context: navigatorKey!.currentContext!,
      //   title: "Error",
      //   content: DioCustomException.fromDioError(err.type, err.response!.statusCode??500).errorMessage,
      //   actionButtonText: "OK",
      // );
      throw DioException(
          requestOptions: err.requestOptions,
          message: DioCustomException.fromDioError(err.type, err.response!.statusCode??500).errorMessage);
    }
  }

}

class InvalidTokenException extends DioException {
  InvalidTokenException(RequestOptions r, String message)
      : super(requestOptions: r);

  @override
  String toString() {
    return 'InvalidTokenException';
  }
}

class DefaultException extends DioException {
  DefaultException(RequestOptions r, String message) : super(requestOptions: r);

  @override
  String toString() {
    return 'DefaultException';
  }
}

class AuthException extends DioException {
  AuthException(RequestOptions r, String message) : super(requestOptions: r);

  @override
  String toString() {
    return 'AuthException';
  }
}

class BiometricException extends DioException {
  BiometricException(RequestOptions r, String message)
      : super(requestOptions: r);

  @override
  String toString() {
    return 'BiometricException';
  }
}

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
