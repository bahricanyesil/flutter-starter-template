part of 'network_manager.dart';

extension NetworkManagerOperations on NetworkManager {
  Future<bool> _tokenCheck() async {
    final DateTime accessExpires =
        await _getTokenExpires(LocalManagerKeys.accessTokenExpires);
    final DateTime compareDate = DateTime.now().add(const Duration(seconds: 5));
    if (accessExpires.isBefore(compareDate)) {
      final DateTime refreshExpires =
          await _getTokenExpires(LocalManagerKeys.refreshTokenExpires);
      if (refreshExpires.isBefore(compareDate)) return false;
      await _refreshToken();
    }
    return true;
  }

  Future<void> _refreshToken() async {
    final String oldRefreshToken =
        await localManager.getString(LocalManagerKeys.refreshToken);
    final IResponseModel<RefreshTokenResponse> response =
        await _authenticationService
            .refreshToken(RefreshTokenRequest(refreshToken: oldRefreshToken));
    final String? accessToken = response.data?.accessToken;
    final String? refreshToken = response.data?.refreshToken;
    options.headers['Authorization'] = accessToken;
    if (accessToken != null && refreshToken != null) {
      await _storeToken(accessToken, LocalManagerKeys.accessToken);
      await _storeToken(refreshToken, LocalManagerKeys.refreshToken);
    } else {
      await NavigationManager.instance
          .navigateToPageClear(path: NavigationConstants.login);
    }
  }

  Future<void> _storeToken(String token, LocalManagerKeys key) async {
    final bool isAccess = key == LocalManagerKeys.accessToken;
    await localManager.setString(key, token);
    // TODO(bahrican): Adjust the value
    final String expiresIn = DateTime.now()
        .add(isAccess ? const Duration(minutes: 57) : const Duration(days: 355))
        .toIso8601String();
    await localManager.setString(
      isAccess
          ? LocalManagerKeys.accessTokenExpires
          : LocalManagerKeys.refreshTokenExpires,
      expiresIn,
    );
  }

  Future<DateTime> _getTokenExpires(LocalManagerKeys key) async {
    final String expireString = await localManager.getString(key);
    return expireString == ''
        ? DateTime.now().subtract(const Duration(minutes: 1))
        : DateTime.parse(expireString);
  }
}
