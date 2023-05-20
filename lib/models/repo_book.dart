import 'package:hive/hive.dart';

part 'repo_book.g.dart'; // digunakan untuk generate file menggunakan build_runner

@HiveType(typeId: 0)
class Lub extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  final String fullName;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String htmlUrl;

  Lub({
    required this.fullName,
    required this.description,
    required this.htmlUrl,
  });
}
