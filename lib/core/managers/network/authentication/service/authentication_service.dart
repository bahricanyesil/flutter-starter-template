import '../../../../constants/enums/request_types.dart';
import '../../../../models/authentication/authentication_models_shelf.dart';
import '../../../../models/response/l_response_model.dart';
import '../../network_manager.dart';
import '../authentication_shelf.dart';

class AuthenticationService implements IAuthenticationService {
  @override
  final NetworkManager networkManager;
  const AuthenticationService({required this.networkManager});

  static const String apiPrefix = 'users/';

  @override
  Future<IResponseModel<TokenResponse>> refreshToken(
          RefreshTokenRequest refreshToken) async =>
      networkManager.send<TokenResponse, RefreshTokenRequest>(
        _getPath('refresh_token'),
        parseModel: TokenResponse(),
        body: refreshToken,
        type: RequestTypes.post,
        requireAuth: false,
      );

  static String _getPath(String val) => '$apiPrefix$val';
}
