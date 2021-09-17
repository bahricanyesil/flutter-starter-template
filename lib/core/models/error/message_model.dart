import 'package:json_annotation/json_annotation.dart';
import '../../../../core/base/model/base_model.dart';
part 'message_model.g.dart';

@JsonSerializable()
class MessageModel implements BaseModel<MessageModel> {
  const MessageModel({required this.en, required this.tr});

  final String en;
  final String? tr;

  @override
  MessageModel fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  MessageModel.fromJson(Map<String, dynamic> json)
      : en = json['en'] as String,
        tr = json['tr'] as String?;

  @override
  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
