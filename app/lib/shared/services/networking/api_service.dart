import 'package:dio/dio.dart';
//helpers
import '../../common/common.dart';

//services
import 'api_interface.dart';
import 'dio_service.dart';
import 'network_exception.dart';

/// A service class implementing methods for basic API requests.
class ApiService implements ApiInterface {
  /// A public constructor that is used to initialize the API service
  /// and setup the underlying [_dioService].
  ApiService(DioService dioService) : _dioService = dioService;

  /// An instance of [DioService] for network requests
  late final DioService _dioService;

  /// An implementation of the base method for requesting collection of data
  /// from the [endpoint].
  /// The response body must be a [List], else the [converter] fails.
  ///
  /// The [converter] callback is used to **deserialize** the response body
  /// into a [List] of objects of type [T].
  /// The callback is executed on each member of the response `body` List.
  /// [T] is usually set to a `Model`.
  ///
  /// [queryParams] holds any query parameters for the request.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [requiresAuthToken] is used to decide if a token will be inserted
  /// in the **headers** of the request using an [ApiInterceptor].
  /// The default value is `true`.
  @override
  Future<List<T>> getCollectionData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(JSON responseBody) converter,
  }) async {
    //Entire map of response
    final List<dynamic> data = await _dioService.get(
      endpoint: endpoint,
      options: Options(headers: <String, Object?>{
        'requiresAuthToken': requiresAuthToken,
      }),
      queryParams: queryParams,
      cancelToken: cancelToken,
    );

    //Returning the deserialized objects
    return data.map((dynamic dataMap) => converter(dataMap as JSON)).toList();
  }

  /// An implementation of the base method for requesting a document of data
  /// from the [endpoint].
  /// The response body must be a [Map], else the [converter] fails.
  ///
  /// The [converter] callback is used to **deserialize** the response body
  /// into an object of type [T].
  /// The callback is executed on the response `body`.
  /// [T] is usually set to a `Model`.
  ///
  /// [queryParams] holds any query parameters for the request.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [requiresAuthToken] is used to decide if a token will be inserted
  /// in the **headers** of the request using an [ApiInterceptor].
  /// The default value is `true`.
  @override
  Future<T> getDocumentData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(JSON responseBody) converter,
  }) async {
    try {
      //Entire map of response
      final JSON data = await _dioService.get(
        endpoint: endpoint,
        queryParams: queryParams,
        options: Options(
            headers: <String, Object?>{'requiresAuthToken': requiresAuthToken}),
        cancelToken: cancelToken,
      );

      //Returning the deserialized object
      return converter(data);
    } catch (ex) {
      throw NetworkException.getDioException(ex);
    }
  }

  /// An implementation of the base method for inserting [data] at
  /// the [endpoint].
  /// The response body must be a [Map], else the [converter] fails.
  ///
  /// The [data] contains body for the request.
  ///
  /// The [converter] callback is used to **deserialize** the response body
  /// into an object of type [T].
  /// The callback is executed on the response `body`.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [requiresAuthToken] is used to decide if a token will be inserted
  /// in the **headers** of the request using an [ApiInterceptor].
  /// The default value is `true`.
  @override
  Future<T> setData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(JSON response) converter,
  }) async {
    try {
      //Entire map of response
      final JSON dataMap = await _dioService.post(
        endpoint: endpoint,
        data: data,
        options: Options(
            headers: <String, Object?>{'requiresAuthToken': requiresAuthToken}),
        cancelToken: cancelToken,
      );

      return converter(dataMap);
    } catch (ex) {
      throw NetworkException.getDioException(ex);
    }
  }

  /// An implementation of the base method for updating [data]
  /// at the [endpoint].
  /// The response body must be a [Map], else the [converter] fails.
  ///
  /// The [data] contains body for the request.
  ///
  /// The [converter] callback is used to **deserialize** the response body
  /// into an object of type [T].
  /// The callback is executed on the response `body`.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [requiresAuthToken] is used to decide if a token will be inserted
  /// in the **headers** of the request using an [ApiInterceptor].
  /// The default value is `true`.
  @override
  Future<T> updateData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(JSON response) converter,
  }) async {
    try {
      //Entire map of response
      final JSON dataMap = await _dioService.patch(
        endpoint: endpoint,
        data: data,
        options: Options(
            headers: <String, Object?>{'requiresAuthToken': requiresAuthToken}),
        cancelToken: cancelToken,
      );

      return converter(dataMap);
    } catch (ex) {
      throw NetworkException.getDioException(ex);
    }
  }

  /// An implementation of the base method for deleting [data]
  /// at the [endpoint].
  /// The response body must be a [Map], else the [converter] fails.
  ///
  /// The [data] contains body for the request.
  ///
  /// The [converter] callback is used to **deserialize** the response body
  /// into an object of type [T].
  /// The callback is executed on the response `body`.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [requiresAuthToken] is used to decide if a token will be inserted
  /// in the **headers** of the request using an [ApiInterceptor].
  /// The default value is `true`.
  @override
  Future<T> deleteData<T>({
    required String endpoint,
    JSON? data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(JSON response) converter,
  }) async {
    try {
      //Entire map of response
      final JSON dataMap = await _dioService.delete(
        endpoint: endpoint,
        data: data,
        options: Options(
            headers: <String, Object?>{'requiresAuthToken': requiresAuthToken}),
        cancelToken: cancelToken,
      );

      return converter(dataMap);
    } catch (ex) {
      throw NetworkException.getDioException(ex);
    }
  }

  /// An implementation of the base method for cancelling
  /// requests pre-maturely using the [cancelToken].
  ///
  /// If null, the **default** [cancelToken] inside [DioService] is used.
  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _dioService.cancelRequests(cancelToken: cancelToken);
  }
}
