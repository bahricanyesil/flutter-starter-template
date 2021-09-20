import '../../../core/base/model/base_model.dart';
import 'home_response_model.dart';

class HomeModel implements BaseModel<HomeModel> {
  HomeModel({
    this.greeting,
    this.texts,
    this.response,
    this.instructions,
  });

  final String? greeting;
  final List<String>? texts;
  final HomeResponseModel? response;
  final List<HomeResponseModel>? instructions;

  @override
  HomeModel fromJson(Map<String, dynamic> json) => HomeModel.fromJson(json);

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        greeting: BaseModel.getByType<String>(json["greeting"]),
        texts: BaseModel.getByType<List<String>>(json["texts"]),
        response: BaseModel.embeddedModelFromJson(
          json['response'],
          const HomeResponseModel(),
        ),
        instructions: BaseModel.embeddedListFromJson<HomeResponseModel>(
          json['instructions'],
          const HomeResponseModel(),
        ),
      );

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        "greeting": greeting,
        "texts": texts,
        "response": BaseModel.embeddedModelToJson(response),
        "instructions": BaseModel.embeddedListToJson(instructions),
      };
}
