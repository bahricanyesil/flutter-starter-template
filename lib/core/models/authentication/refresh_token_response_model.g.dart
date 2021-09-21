// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TokenResponseAdapter extends TypeAdapter<TokenResponse> {
  @override
  final int typeId = 1;

  @override
  TokenResponse read(BinaryReader reader) {
    final int numOfFields = reader.readByte();
    final Map<int, dynamic> fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TokenResponse(
      accessToken: fields[0] as String?,
      refreshToken: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TokenResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.accessExpires)
      ..writeByte(2)
      ..write(obj.refreshToken)
      ..writeByte(3)
      ..write(obj.refreshExpires);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokenResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
