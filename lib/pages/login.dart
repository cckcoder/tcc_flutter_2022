import 'package:flutter/material.dart';
import 'package:inventory_workshop/config.dart';
import 'package:inventory_workshop/models/login.dart';
import 'package:inventory_workshop/networks/userAPI.dart';
import 'package:inventory_workshop/utils/snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';
  var _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(50),
            child: Column(
              children: [
                Image.asset(
                  'images/inventory.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Inventory',
                  style: Theme.of(context).textTheme.headline1,
                )
              ],
            ),
          ),
          Form(
            key: _keyForm,
            child: Column(
              children: [
                ListTile(
                  title: _textFormField(
                      label: 'Username',
                      onSave: (String? value) {
                        username = value!;
                      }),
                ),
                ListTile(
                  title: _textFormField(
                      label: 'Password',
                      onSave: (String? value) {
                        password = value!;
                      }),
                ),
                ListTile(
                  title: ElevatedButton(
                    child: Text('Login'),
                    onPressed: login,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/register'),
                  child: Text('Need an Account'),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget _textFormField({required String label, onSave}) {
    return TextFormField(
      validator: _validateSting,
      onSaved: (String? v) => onSave(v),
      decoration: InputDecoration(labelText: label, hintText: label),
    );
  }

  String? _validateSting(String? value) {
    if (value == null || value == '') {
      return 'Please fill data';
    }
    return null;
  }

  login() async {
    if (_keyForm.currentState!.validate()) {
      _keyForm.currentState!.save();
      UserAPI userAPI = UserAPI();
      Login? login =
          await userAPI.login(username: username, password: password);
      if (login == null) {
        SnackBarHelper.show(
            context: context, msg: 'Invalid user', color: Colors.red);
        return;
      }
      TOKEN = login.accessToken;
      SnackBarHelper.show(
          context: context, msg: 'Welcome to Inventory', color: Colors.green);
      Navigator.pushNamed(context, '/home');
    }
  }
}
