part of 'network_manager.dart';

extension NetworkManagerOperations on NetworkManager {
  Future<bool> _tokenCheck() async {
    final DateTime compareDate =
        DateTime.now().add(const Duration(seconds: 10));
    final TokenResponse? tokenRes =
        localManager.getAuth(AuthKeys.tokenResponse);
    if (tokenRes?.refreshToken == null) return false;
    if (tokenRes!.accessExpires.isBefore(compareDate) ||
        tokenRes.accessToken == null) {
      if (tokenRes.refreshExpires.isBefore(compareDate)) {
        return false;
      }
      return _refreshToken(tokenRes.refreshToken!);
    }
    return true;
  }

  Future<bool> _refreshToken(String oldRefreshToken) async {
    final IResponseModel<TokenResponse> response = await _authenticationService
        .refreshToken(RefreshTokenRequest(refreshToken: oldRefreshToken));
    final TokenResponse? data = response.data;
    if (data != null && data.accessToken != null && data.refreshToken != null) {
      options.headers['Authorization'] = data.accessToken;
      await localManager.setAuth(AuthKeys.tokenResponse, data);
      return true;
    }
    await NavigationManager.instance.setNewRoutePath(ScreenConfig.login());
    return false;
  }
}
