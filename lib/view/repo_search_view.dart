import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_github/view/repos_catalog_view.dart';
import 'package:project_github/view/timeconversion.dart';
import 'package:project_github/view/users_catalog_view.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'bookmark_view.dart';

class RepoSearch extends StatefulWidget {
  const RepoSearch({Key? key}) : super(key: key);

  @override
  _RepoSearchState createState() => _RepoSearchState();
}

class _RepoSearchState extends State<RepoSearch> {
  final _controller = TextEditingController();
  String? text;
  List<dynamic> repositories = [];

  @override
  void initState() {
    super.initState();
    fetchRepositories();
  }

  Future<void> fetchRepositories() async {
    final response =
        await http.get(Uri.parse('https://api.github.com/repositories'));

    if (response.statusCode == 200) {
      setState(() {
        repositories = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch repositories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Repository Search"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.timer,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Calendar(),
                  ));
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        selectionHeightStyle: BoxHeightStyle.max,
                        style: GoogleFonts.nunitoSans(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.nunitoSans(
                            color: Colors.grey,
                            fontSize: 15.0,
                          ),
                          hintText: "Github Repository",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0,
                          ),
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        ),
                        controller: _controller,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ReposCatalog(text: _controller.text);
                      }));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.deepPurple),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0, // Ubah nilai padding vertikal
                        horizontal: 12.0, // Ubah nilai padding horizontal
                      ),
                      child: Text(
                        "Search",
                        style: GoogleFonts.nunitoSans(
                          textStyle: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 16.0, // Ubah ukuran font
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: repositories.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        repositories[index]['owner']['avatar_url'],
                      ),
                    ),
                    title: Text(repositories[index]['name']),
                    subtitle: Text(repositories[index]['html_url']),
                    onTap: () {
                      _launchURL(repositories[index]['html_url']);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    await launchUrl(Uri.parse(url));
  }
}
