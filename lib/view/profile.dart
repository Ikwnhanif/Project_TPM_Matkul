import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<User> _userData;

  @override
  void initState() {
    super.initState();
    _userData = fetchUserData();
  }

  Future<User> fetchUserData() async {
    final response = await http
        .get(Uri.parse('https://api.github.com/search/users?q=ikwnhanif'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final items = jsonData['items'];
      if (items != null && items.isNotEmpty) {
        final userData = User.fromJson(items[0]);
        return userData;
      }
    }

    throw Exception('Failed to fetch user data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: _userData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final user = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(user.avatarUrl),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Username: ${user.username}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Muhammad Ikhwan Hanif',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '123200096',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      launch(user.htmlUrl);
                    },
                    child: Text('Visit GitHub'),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Failed to fetch user data');
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class User {
  final String username;
  final String avatarUrl;
  final String htmlUrl;

  User({
    required this.username,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['login'],
      avatarUrl: json['avatar_url'],
      htmlUrl: json['html_url'],
    );
  }
}
