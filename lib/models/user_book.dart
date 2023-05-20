import 'package:hive/hive.dart';

part 'user_book.g.dart'; // digunakan untuk generate file menggunakan build_runner

@HiveType(typeId: 0)
class Lib extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  final String avatarUrl;
  @HiveField(2)
  final String login;
  @HiveField(3)
  final String htmlUrl;

  Lib({
    required this.avatarUrl,
    required this.login,
    required this.htmlUrl,
  });
}
