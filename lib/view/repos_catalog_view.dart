import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_github/controller/repos_data_source.dart';
import 'package:project_github/models/repositories.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: Card(
        child: Container(
          // FutureBuilder() membentuk hasil Future dari request API
          child: FutureBuilder(
            future: RepoDataSource.instance.loadRepos(widget.text),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError || widget.text.isEmpty) {
                return _buildErrorSection();
              }
              if (snapshot.hasData) {
                Repo repo = Repo.fromJson(snapshot.data);
                return _buildSuccessSection(repo);
              }
              return _buildLoadingSection();
            },
          ),
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
  Widget _buildSuccessSection(Repo repo) {
    return ListView.builder(
      itemCount: repo.items?.length,
      itemBuilder: (BuildContext context, int index) {
        final repoItem = repo.items![index];
        return Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: ListTile(
            onTap: () {
              _launchURL(repoItem.htmlUrl!);
            },
            title: Text(
              "${repoItem.fullName}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "${repoItem.description}",
              style: TextStyle(fontSize: 14),
            ),
            isThreeLine: true,
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        );
      },
    );
  }

  void _launchURL(String url) async {
    await launchUrl(Uri.parse(url));
  }
}
