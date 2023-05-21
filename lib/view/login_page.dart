import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:project_github/data/shared_pref.dart';
import 'package:project_github/service/user_database_helper.dart';
import 'package:project_github/view/menu.dart';
import 'package:project_github/view/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var Username_controller = TextEditingController();
  var Password_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _checkLoginStatus();
  }

  void _checkLoginStatus() {
    SharedPref().getLoginStatus().then((status) {
      if (status) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            children: [
              SizedBox(height: 100),
              _createImage(),
              SizedBox(height: 32),
              _formSection(Username_controller, 'Username'),
              SizedBox(height: 16),
              _formSection(Password_controller, 'Password'),
              SizedBox(height: 10),
              _buttonSubmit(),
              // SizedBox(height: 10),
              _buttonRegister()
            ],
          ),
        ),
      ),
    );
  }

  Widget _createImage() {
    return Container(
      child: Image.asset('assets/images/icon_login.png'),
    );
  }

  Widget _formSection(dynamic textController, String label) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
    );
  }

  Widget _formSectionPass(dynamic textController, String label) {
    return TextField(
      controller: textController,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        labelText: label,
      ),
    );
  }

  Widget _buttonSubmit() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: _loginProcess,
        child: Text("Login"),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        child: Text("Register"),
      ),
    );
  }

  void _loginProcess() {
    String username = Username_controller.text;
    String password = Password_controller.text;
    if (Username_controller.text != "" && Password_controller.text != "") {
      _onLogin();
    } else {
      SnackBar snackBar = SnackBar(
        content: Text("Tidak Boleh Ada Yang Kosong"),
        backgroundColor: Colors.redAccent,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _onLogin() async {
    try {
      await userDatabaseHelper.getUserByUsernameAndPassword(
          Username_controller.text, Password_controller.text);
      SharedPref().setLogin(Username_controller.text);
      final snackbar = SnackBar(content: Text('Berhasil Login'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } catch (e) {
      final snackbar = SnackBar(content: Text('Gagal login'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}
