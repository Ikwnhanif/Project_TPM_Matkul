import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:project_github/controller/users_data_source.dart';
import 'package:project_github/models/user_book.dart';
import 'package:project_github/models/users.dart';
import 'package:project_github/view/bookmark_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../boxes.dart';

class UsersCatalog extends StatefulWidget {
  final String text;

  const UsersCatalog({Key? key, required this.text}) : super(key: key);

  @override
  _UsersCatalogState createState() => _UsersCatalogState();
}

class _UsersCatalogState extends State<UsersCatalog> {
  late String avatarUrl;
  late String login;
  late String htmlUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Github"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark_added,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookmarkView(),
                  ));
            },
          ),
        ],
      ),
      body: Container(
        // FutureBuilder() membentuk hasil Future dari request API
        child: FutureBuilder(
          future: UserDataSource.instance.loadUsers(widget.text),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError || widget.text.isEmpty) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              Users user = Users.fromJson(snapshot.data);
              return _buildSuccessSection(user);
            }
            return _buildLoadingSection();
          },
        ),
      ),
    );
  }

  // Jika API sedang dipanggil
  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorSection() {
    if (widget.text.isEmpty) {
      return const Text("Search bar cannot be Empty");
    } else {
      return const Text("Error");
    }
  }

  // Jika data ada
  Widget _buildSuccessSection(Users data) {
    return ListView.builder(
      itemCount: data.items?.length,
      itemBuilder: (BuildContext context, int index) {
        final user = data.items![index];
        return ListTile(
          onTap: () {
            _launchURL(user.htmlUrl!);
          },
          leading: Image(
            image: NetworkImage(user.avatarUrl!),
          ),
          title: Text("${user.login}"),
          subtitle: Text(
            "${user.htmlUrl}",
            style: TextStyle(fontSize: 11.0),
          ),
          isThreeLine: true,
          trailing: ElevatedButton.icon(
            onPressed: () {
              avatarUrl = "${user.avatarUrl!}";
              login = "${user.login}";
              htmlUrl = "${user.htmlUrl}";
              _onFormSubmit();
            },
            icon: const Icon(
              Icons.add,
              size: 16.0,
            ),
            label: Text('Add to Bookmark'),
          ),
        );
      },
    );
  }

  void _onFormSubmit() {
    Box<Lib> libBox = Hive.box<Lib>(HiveBoxes.lib);
    libBox.add(Lib(avatarUrl: avatarUrl, login: login, htmlUrl: htmlUrl));
    print(libBox);
  }

  void _launchURL(String url) async {
    await launchUrl(Uri.parse(url));
  }
}
