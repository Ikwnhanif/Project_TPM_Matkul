import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_github/view/repos_catalog_view.dart';
import 'package:project_github/view/users_catalog_view.dart';

import 'bookmark_view.dart';

class RepoSearch extends StatefulWidget {
  const RepoSearch({Key? key}) : super(key: key);

  @override
  _RepoSearchState createState() => _RepoSearchState();
}

class _RepoSearchState extends State<RepoSearch> {
  final _controller = TextEditingController();
  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repository Search"),
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
                          hintText: "Enter Github Repository",
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
                        return UsersCatalog(text: _controller.text);
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
          ],
        ),
      ),
    );
  }
}
