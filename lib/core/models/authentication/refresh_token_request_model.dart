import '../../base/model/base_model.dart';

class RefreshTokenRequest implements BaseModel<RefreshTokenRequest> {
  const RefreshTokenRequest({
    this.refreshToken,
  });

  final String? refreshToken;

  @override
  RefreshTokenRequest fromJson(Map<String, dynamic> json) =>
      RefreshTokenRequest.fromJson(json);

  factory RefreshTokenRequest.fromJson(Map<String, dynamic> json) =>
      RefreshTokenRequest(
        refreshToken: BaseModel.getByType<String>(json['refreshToken']),
      );

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        "refreshToken": refreshToken,
      };
}
