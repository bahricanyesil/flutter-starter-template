import '../../../../constants/enums/request_types.dart';
import '../../../../models/response/l_response_model.dart';
import '../../network_manager.dart';
import '../authentication_shelf.dart';

class AuthenticationService implements IAuthenticationService {
  @override
  final NetworkManager networkManager;
  const AuthenticationService({required this.networkManager});

  static const String apiPrefix = 'users/';

  @override
  Future<IResponseModel<RefreshTokenResponse>> refreshToken(
          RefreshTokenRequest refreshToken) async =>
      networkManager.send<RefreshTokenResponse, RefreshTokenRequest>(
        _getPath('refresh_token'),
        parseModel: const RefreshTokenResponse(),
        body: refreshToken,
        type: RequestTypes.post,
        requireAuth: false,
      );

  static String _getPath(String val) => '$apiPrefix$val';
}
