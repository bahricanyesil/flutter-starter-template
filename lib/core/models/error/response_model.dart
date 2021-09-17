import 'package:json_annotation/json_annotation.dart';
import '../../../../core/base/model/base_model.dart';
import 'message_model.dart';
part 'response_model.g.dart';

@JsonSerializable()
class ResponseBodyModel implements BaseModel<ResponseBodyModel> {
  const ResponseBodyModel({this.message, this.resultCode, this.field});

  final MessageModel? message;
  final int? resultCode;
  final String? field;

  @override
  ResponseBodyModel fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  ResponseBodyModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as MessageModel? ??
            MessageModel(en: json['message'], tr: json['message']),
        resultCode = json['resultCode'] as int?,
        field = json['field'] as String?;

  @override
  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
