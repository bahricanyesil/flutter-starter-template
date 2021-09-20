import '../../../core/constants/enums/request_types.dart';
import '../../../core/models/response/l_response_model.dart';
import '../model/home_models_shelf.dart';
import 'home_constants.dart';
import 'l_home_service.dart';

class HomeService extends IHomeService {
  @override
  String get apiPrefix => '/home';

  @override
  Future<IResponseModel<HomeResponseModel>> home(HomeModel homeBody) async =>
      networkManager.send<HomeResponseModel, HomeModel>(
        getPath(HomeConstants.home),
        parseModel: const HomeResponseModel(),
        body: homeBody,
        type: RequestTypes.post,
        requireAuth: false,
      );
}
