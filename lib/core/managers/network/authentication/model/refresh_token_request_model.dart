import 'package:json_annotation/json_annotation.dart';
import '../../../../base/model/base_model.dart';

part 'refresh_token_request_model.g.dart';

@JsonSerializable()
class RefreshTokenRequest implements BaseModel<RefreshTokenRequest> {
  const RefreshTokenRequest({
    this.refreshToken,
  });

  final String? refreshToken;

  @override
  RefreshTokenRequest fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RefreshTokenRequestToJson(this);
}
