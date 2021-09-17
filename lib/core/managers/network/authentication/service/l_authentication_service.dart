import '../../../../models/response/l_response_model.dart';
import '../../network_manager.dart';
import '../model/authentication_models_shelf.dart';

abstract class IAuthenticationService {
  final NetworkManager networkManager;
  const IAuthenticationService({required this.networkManager});

  Future<IResponseModel<RefreshTokenResponse>> refreshToken(
      RefreshTokenRequest refreshToken);
}
