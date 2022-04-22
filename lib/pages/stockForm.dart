import 'package:flutter/material.dart';
import 'package:inventory_workshop/models/stock.dart';
import 'package:inventory_workshop/networks/inventoryAPI.dart';
import 'package:inventory_workshop/utils/snackbar.dart';

class StockFormScreen extends StatefulWidget {
  const StockFormScreen({Key? key}) : super(key: key);

  @override
  _StockFormScreenState createState() => _StockFormScreenState();
}

class _StockFormScreenState extends State<StockFormScreen> {
  var _formkey = GlobalKey<FormState>();
  Stock newStock = Stock();
  @override
  Widget build(BuildContext context) {
    Stock? oldStock = ModalRoute.of(context)!.settings.arguments as Stock?;

    if (oldStock == null) {
      oldStock = Stock();
    } else {
      newStock.id = oldStock.id;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Form'),
      ),
      body: Container(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              ListTile(
                title: _textFormField(
                    initialValue: oldStock.description.toString(),
                    label: 'Name',
                    onValidate: (String? value) => _validateSting(value),
                    onSave: (String? value) {
                      newStock.description = value;
                    }),
              ),
              ListTile(
                title: _textFormField(
                    initialValue: oldStock.stock.toString(),
                    label: 'Stock',
                    inputType: TextInputType.number,
                    onValidate: (String? value) => _validateNumber(value),
                    onSave: (String? value) {
                      newStock.stock = double.parse(value!);
                    }),
              ),
              ListTile(
                title: _textFormField(
                    initialValue: oldStock.price.toString(),
                    label: 'Price',
                    inputType: TextInputType.number,
                    onValidate: (String? value) => _validateNumber(value),
                    onSave: (String? value) {
                      newStock.price = double.parse(value!);
                    }),
              ),
              ListTile(
                  title: ElevatedButton(
                child: Text('Submit'),
                onPressed: () => submit(oldStock?.id),
              )),
              Visibility(
                visible: oldStock.id != -1,
                child: ListTile(
                    title: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Text('Delete'),
                  onPressed: () => delete(oldStock?.id),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFormField(
      {required String label,
      required Function onSave,
      required Function onValidate,
      required String initialValue,
      TextInputType inputType = TextInputType.text}) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: inputType,
      onSaved: (String? value) => onSave(value),
      validator: (String? value) => onValidate(value),
      decoration: InputDecoration(labelText: label, hintText: label),
    );
  }

  submit(int? id) async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      InventoryAPI inventoryAPI = InventoryAPI();
      Stock? stock;
      if (id == -1) {
        stock = await inventoryAPI.createStock(stock: newStock);
      } else {
        stock = await inventoryAPI.updateStock(stock: newStock);
      }

      if (stock == null) {
        SnackBarHelper.show(
            context: context, msg: 'Something went wrong', color: Colors.red);
      } else {
        SnackBarHelper.show(
            context: context,
            msg: 'Update Stock Complete',
            color: Colors.green);
        Navigator.pop(context);
      }
    }
  }

  String? _validateSting(String? value) {
    if (value == null || value == '') {
      return 'Please fill data';
    }
    return null;
  }

  String? _validateNumber(String? value) {
    if (value == null || value == '') {
      return 'Please fill data';
    }
    if (double.tryParse(value) == null) {
      return 'Invalid number';
    }
    return null;
  }

  delete(int? id) async {
    InventoryAPI inventoryAPI = InventoryAPI();
    String? msg = await inventoryAPI.deleteStock(id: id!);
    SnackBarHelper.show(context: context, msg: msg!);
    Navigator.pop(context);
  }
}
