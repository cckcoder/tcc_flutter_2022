import 'package:flutter/material.dart';

class StockFormScreen extends StatefulWidget {
  const StockFormScreen({Key? key}) : super(key: key);

  @override
  _StockFormScreenState createState() => _StockFormScreenState();
}

class _StockFormScreenState extends State<StockFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Form'),
      ),
      body: Container(
        child: Form(
          child: Column(
            children: [
              ListTile(
                title: _textFormField(label: 'Name'),
              ),
              ListTile(
                title: _textFormField(label: 'Stock'),
              ),
              ListTile(
                title: _textFormField(label: 'Price'),
              ),
              ListTile(
                  title: ElevatedButton(
                child: Text('submit'),
                onPressed: submit,
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFormField({required String label}) {
    return TextFormField(
      decoration: InputDecoration(labelText: label, hintText: label),
    );
  }

  submit() {}
}
