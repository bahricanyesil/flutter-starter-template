import '../../../../core/base/model/base_model.dart';
import 'message_model.dart';

class ResponseBodyModel implements BaseModel<ResponseBodyModel> {
  const ResponseBodyModel({this.message, this.resultCode, this.field});

  final MessageModel? message;
  final int? resultCode;
  final String? field;

  @override
  ResponseBodyModel fromJson(Map<String, dynamic> json) =>
      ResponseBodyModel.fromJson(json);

  factory ResponseBodyModel.fromJson(Map<String, dynamic> json) =>
      ResponseBodyModel(
        message: BaseModel.embeddedModelFromJson(
            json['message'], const MessageModel()),
        resultCode: BaseModel.getByType<int>(json['resultCode']),
        field: BaseModel.getByType<String>(json['field']),
      );

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        "message": BaseModel.embeddedModelToJson(message),
        "resultCode": resultCode,
        "field": field,
      };
}
