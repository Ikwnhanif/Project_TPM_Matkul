import '../service/base_network_repo.dart';

//Dengan memanggil method loadBooks(),  mengembalikan nilai dari class
//BaseNetwork dengan method get() diisi dengan parameter “text” dikarenakan ingin
//mengambil list dari user.

class RepoDataSource {
  static RepoDataSource instance = RepoDataSource();
  Future<Map<String, dynamic>> loadRepos(String text) {
    return BaseNetwork.get(text);
  }
}
