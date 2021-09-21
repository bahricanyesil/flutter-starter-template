import 'package:hive/hive.dart';

import '../../../core/base/model/base_model.dart';
import '../../../core/managers/local/local_manager.dart';

part 'home_model.g.dart';

@HiveType(typeId: HiveTypeConfig.homeModel)
class HomeModel extends HiveObject implements BaseModel<HomeModel> {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? greeting;

  @HiveField(2)
  final List<String>? texts;

  @HiveField(3, defaultValue: false)
  final bool trial;

  // final HomeResponseModel? response;
  // final List<HomeResponseModel>? instructions;

  HomeModel({
    this.id,
    this.greeting,
    this.texts,
    this.trial = false,
    // this.response,
    // this.instructions,
  });

  @override
  HomeModel fromJson(Map<String, dynamic> json) => HomeModel.fromJson(json);

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        id: BaseModel.getByType<String>(json['id']),
        greeting: BaseModel.getByType<String>(json["greeting"]),
        texts: BaseModel.getByType<List<String>>(json["texts"]),
        trial: json['trial'] == true,
        // response: BaseModel.embeddedModelFromJson(
        //   json['response'],
        //   const HomeResponseModel(),
        // ),
        // instructions: BaseModel.embeddedListFromJson<HomeResponseModel>(
        //   json['instructions'],
        //   const HomeResponseModel(),
        // ),
      );

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "greeting": greeting,
        "texts": texts,
        "trial": trial,
        // "response": BaseModel.embeddedModelToJson(response),
        // "instructions": BaseModel.embeddedListToJson(instructions),
      };
}
