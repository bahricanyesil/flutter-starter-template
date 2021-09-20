import '../../../core/base/service/base_service.dart';
import '../../../core/models/response/l_response_model.dart';
import '../model/home_models_shelf.dart';

abstract class IHomeService extends BaseService {
  Future<IResponseModel<HomeResponseModel>> home(HomeModel homeBody);
}
