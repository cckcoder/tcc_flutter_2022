import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ListTile(
                title: _textFormField(
                  label: 'username',
                  onSave: (String? v) {
                    username = v!;
                  },
                ),
              ),
              ListTile(
                title: _textFormField(
                  label: 'password',
                  onSave: (String? v) {
                    password = v!;
                  },
                ),
              ),
              ListTile(
                  title: ElevatedButton(
                child: Text('submit'),
                onPressed: register,
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFormField({required String label, onSave}) {
    return TextFormField(
      validator: _validateSting,
      onSaved: (String? v) => onSave(v),
      decoration: InputDecoration(labelText: label, hintText: label),
    );
  }

  register() {
    if (_formKey.currentState!.validate()) {}
  }

  String? _validateSting(String? value) {
    if (value == null || value == '') {
      return 'Please fill data';
    }
    return null;
  }
}
