// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseBodyModel _$ResponseModelFromJson(Map<String, dynamic> json) =>
    ResponseBodyModel(
      message: json['message'] is Map<String, dynamic>
          ? MessageModel.fromJson(json['message'])
          : const MessageModel(
              en: 'Error could not parse',
              tr: 'Hata belirlenemedi.',
            ),
      resultCode: json['resultCode'] as int?,
      field: json['field'] as String?,
    );

Map<String, dynamic> _$ResponseModelToJson(ResponseBodyModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'resultCode': instance.resultCode,
      'field': instance.field,
    };
