import '../service/base_network_repo.dart';

class RepoDataSource {
  static RepoDataSource instance = RepoDataSource();
  Future<Map<String, dynamic>> loadRepos(String text) {
    return BaseNetwork.get(text);
  }
}
