import '../../../core/base/model/base_model.dart';

class HomeResponseModel implements BaseModel<HomeResponseModel> {
  const HomeResponseModel({
    this.greeting,
    this.instructions,
  });

  final String? greeting;
  final List<String>? instructions;

  @override
  HomeResponseModel fromJson(Map<String, dynamic> json) =>
      HomeResponseModel.fromJson(json);

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
        greeting: BaseModel.getByType<String>(json["greeting"]),
        instructions: BaseModel.getByType<List<String>>(json["instructions"]),
      );

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        "greeting": greeting,
        "instructions": instructions,
      };
}
