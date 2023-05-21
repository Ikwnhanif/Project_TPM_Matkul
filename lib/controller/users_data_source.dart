import '../service/base_network.dart';

class UserDataSource {
  static UserDataSource instance = UserDataSource();
  Future<Map<String, dynamic>> loadUsers(String text) {
    return BaseNetwork.get(text);
  }
}
