import 'package:dio/dio.dart';
import 'package:task_manager/app/app.dart';


class DioService implements HttpService {

  factory DioService() => _instance;


  DioService._({
    Dio? dioOverride,
  }) {
    //_dio = Dio(baseOptions);
    _dio = dioOverride ?? Dio(baseOptions);
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            //get token from local storage
            final storageService = HiveStorageService.instance;
            final token = storageService.get(StorageKey.firebaseIdToken.name);

            // Add the access token to the request header
            options.headers['Authorization'] = 'Bearer $token';
            return handler.next(options);
          },
        ),

      );
  }

  late final Dio _dio;
  static final DioService _instance = DioService._();


  BaseOptions get baseOptions => BaseOptions(
    connectTimeout: const Duration(seconds: 200),
    receiveTimeout: const Duration(seconds: 200),
    baseUrl: baseUrl,
    headers: headers,
    validateStatus: (_)=> true,
  );

  @override
  String get baseUrl => AppConfig.baseUrl;

  @override
  Map<String, String> get headers => {
    'accept': 'application/json',
    'content-type': 'application/json',
  };

  @override
  Future<Response<dynamic>> request(String path, RequestMethod method,
      {dynamic savePath,
        Map<String, dynamic>? queryParams,
        dynamic data,
        Options? options,}) async {
    Response<dynamic> response;

    try {
      switch (method) {
        case RequestMethod.post:
          response = await _dio.post(
            path,
            queryParameters: queryParams,
            data: data,
          );
        case RequestMethod.get:
          response = await _dio.get(
            path,
            options: options,
            queryParameters: queryParams,
          );

        case RequestMethod.put:
          response = await _dio.put(
            path,
            queryParameters: queryParams,
            data: data,
          );
        case RequestMethod.delete:
          response = await _dio.delete(
            path,
            data: data,
          );
      }
      return response;
    } on DioException catch (e) {
      BaseUtils.basicPrint(e.toString());
      final errorMessage = DioErrorHandler.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
