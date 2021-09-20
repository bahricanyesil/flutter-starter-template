import '../../managers/network/l_network_manager.dart';
import '../../managers/network/network_manager.dart';

abstract class BaseService {
  final INetworkManager networkManager = NetworkManager.instance;
  String get apiPrefix;
  String getPath(String val) => '$apiPrefix$val';
}
