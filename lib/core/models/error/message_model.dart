import '../../../../core/base/model/base_model.dart';

class MessageModel implements BaseModel<MessageModel> {
  const MessageModel({this.en = '', this.tr});

  final String en;
  final String? tr;

  @override
  MessageModel fromJson(Map<String, dynamic> json) =>
      MessageModel.fromJson(json);

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        en: BaseModel.getWithDefault<String>(json['en'], ''),
        tr: BaseModel.getByType<String>(json["tr"]),
      );

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        "en": en,
        "tr": tr,
      };
}
