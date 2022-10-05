import '../../../shared/common/common.dart';
import '../../../shared/services/service.dart';
import 'authentication_endpoint.dart';

class AuthenticationRepository {
  AuthenticationRepository(ApiService apiService) : _apiService = apiService;

  final ApiService _apiService;

  Future<String> sendLoginData({required JSON data}) {
    return _apiService.setData<String>(
      endpoint: ApiEndpoint.authentication(AuthenticationEndpoint.LOGIN),
      data: data,
      requiresAuthToken: false,
      converter: (JSON response) => response['token'] as String,
    );
  }

  Future<String> getTokenResetPasword({required JSON data}) {
    return _apiService.setData<String>(
      endpoint:
          ApiEndpoint.authentication(AuthenticationEndpoint.FORGOT_PASSWORD),
      data: data,
      requiresAuthToken: false,
      converter: (JSON response) => response['token'] as String,
    );
  }

  Future<String> submitOTP({required JSON data}) {
    return _apiService.setData<String>(
      endpoint: ApiEndpoint.authentication(AuthenticationEndpoint.SUBMIT_OTP),
      data: data,
      requiresAuthToken: false,
      converter: (JSON response) => response['token'] as String,
    );
  }

  Future<String> resendOTP({required JSON data}) {
    return _apiService.setData<String>(
      endpoint: ApiEndpoint.authentication(AuthenticationEndpoint.SUBMIT_OTP),
      data: data,
      requiresAuthToken: false,
      converter: (JSON response) => response['token'] as String,
    );
  }
}
