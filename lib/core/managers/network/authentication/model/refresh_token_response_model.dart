import 'package:json_annotation/json_annotation.dart';
import '../../../../base/model/base_model.dart';

part 'refresh_token_response_model.g.dart';

@JsonSerializable()
class RefreshTokenResponse implements BaseModel<RefreshTokenResponse> {
  const RefreshTokenResponse({
    this.accessToken,
    this.refreshToken,
  });

  final String? accessToken;
  final String? refreshToken;

  @override
  RefreshTokenResponse fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);
}
