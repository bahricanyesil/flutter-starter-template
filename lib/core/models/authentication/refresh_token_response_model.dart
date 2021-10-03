import 'package:hive/hive.dart';

import '../../base/model/base_model.dart';
import '../../managers/local/local_manager.dart';

part 'refresh_token_response_model.g.dart';

@HiveType(typeId: HiveTypeConfig.tokenResponse)
class TokenResponse extends HiveObject implements BaseModel<TokenResponse> {
  @HiveField(0)
  final String? accessToken;

  @HiveField(1)
  final DateTime accessExpires;

  @HiveField(2)
  final String? refreshToken;

  @HiveField(3)
  final DateTime refreshExpires;

  TokenResponse({
    this.accessToken,
    this.refreshToken,
  })  : accessExpires = DateTime.now().add(const Duration(minutes: 58)),
        refreshExpires = DateTime.now().add(const Duration(days: 355));

  @override
  TokenResponse fromJson(Map<String, dynamic> json) =>
      TokenResponse.fromJson(json);

  factory TokenResponse.fromJson(Map<String, dynamic> json) => TokenResponse(
        accessToken: BaseModel.getByType<String>(json['accessToken']),
        refreshToken: BaseModel.getByType<String>(json['refreshToken']),
      );

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}
