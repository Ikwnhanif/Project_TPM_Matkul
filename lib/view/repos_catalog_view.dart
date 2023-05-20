import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:project_github/controller/repos_data_source.dart';
import 'package:project_github/models/repo_book.dart';
import 'package:project_github/models/repositories.dart';

import 'package:project_github/view/bookmark_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../boxes.dart';

class ReposCatalog extends StatefulWidget {
  final String text;

  const ReposCatalog({Key? key, required this.text}) : super(key: key);

  @override
  _ReposCatalogState createState() => _ReposCatalogState();
}

class _ReposCatalogState extends State<ReposCatalog> {
  late String fullName;
  late String description;
  late String htmlUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repository Github"),
      ),
      body: Container(
        // FutureBuilder() membentuk hasil Future dari request API
        child: FutureBuilder(
          future: RepoDataSource.instance.loadRepos(widget.text),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError || widget.text.isEmpty) {
              return _buildErrorSectio();
            }
            if (snapshot.hasData) {
              Repo repo = Repo.fromJson(snapshot.data);
              return _buildSuccessSectio(repo);
            }
            return _buildLoadingSectio();
          },
        ),
      ),
    );
  }

  // Jika API sedang dipanggil
  Widget _buildLoadingSectio() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorSectio() {
    if (widget.text.isEmpty) {
      return const Text("Search bar cannot be Empty");
    } else {
      return const Text("Error");
    }
  }

  // Jika data ada
  Widget _buildSuccessSectio(Repo repu) {
    return ListView.builder(
      itemCount: repu.items?.length,
      itemBuilder: (BuildContext context, int index) {
        final repo = repu.items![index];
        return ListTile(
          onTap: () {
            _launchURL(repo.htmlUrl!);
          },
          title: Text("${repo.fullName}"),
          subtitle: Text(
            "${repo.description}",
            style: TextStyle(fontSize: 11.0),
          ),
          isThreeLine: true,
        );
      },
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
