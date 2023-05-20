import '../service/base_network.dart';

//Dengan memanggil method loadBooks(),  mengembalikan nilai dari class
//BaseNetwork dengan method get() diisi dengan parameter “text” dikarenakan ingin
//mengambil list dari user.

class UserDataSource {
  static UserDataSource instance = UserDataSource();
  Future<Map<String, dynamic>> loadUsers(String text) {
    return BaseNetwork.get(text);
  }
}
