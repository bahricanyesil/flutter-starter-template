import '../../../../models/authentication/authentication_models_shelf.dart';

import '../../../../models/response/l_response_model.dart';
import '../../network_manager.dart';

abstract class IAuthenticationService {
  final NetworkManager networkManager;
  const IAuthenticationService({required this.networkManager});

  Future<IResponseModel<TokenResponse>> refreshToken(
      RefreshTokenRequest refreshToken);
}
