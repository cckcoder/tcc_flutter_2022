import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            child: Column(
              children: [
                ListTile(
                  title: _textFormField(label: 'Username'),
                ),
                ListTile(
                  title: _textFormField(label: 'Password'),
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

  Widget _textFormField({required String label}) {
    return TextFormField(
      decoration: InputDecoration(labelText: label, hintText: label),
    );
  }

  login() {
    Navigator.pushNamed(context, '/home');
  }
}
