abstract class BaseModel<T> {
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);

  static R? getByType<R>(dynamic data) => data is R ? data : null;

  static List<R>? embeddedListFromJson<R extends BaseModel<R>>(
      dynamic json, R model) {
    if (json is List<Map<String, dynamic>>) {
      return List<R>.from(
          json.map((Map<String, dynamic> e) => model.fromJson(e)));
    }
    return null;
  }

  static List<Map<String, dynamic>>? embeddedListToJson<R extends BaseModel<R>>(
      List<R>? list) {
    if (list is List<R>) {
      return List<Map<String, dynamic>>.from(
          list.map((R model) => model.toJson()));
    }
    return null;
  }

  static R? embeddedModelFromJson<R extends BaseModel<R>>(
          dynamic json, R model) =>
      json is Map<String, dynamic> ? model.fromJson(json) : null;

  static Map<String, dynamic>? embeddedModelToJson<R extends BaseModel<R>>(
          R? model) =>
      model is R ? model.toJson() : null;
}
