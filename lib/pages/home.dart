import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_workshop/pages/stockList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<dynamic> pages = [
    StockList(),
    Center(child: Center(child: Text('B'))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'images/inventory.png',
                    width: 70,
                    height: 70,
                  ),
                  const Text(
                    'INVENTORY',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            ListTile(
              selected: _selectedIndex == 0,
              leading: Icon(Icons.list),
              title: Text('Stock'),
              onTap: () => _selectIndex(0),
            ),
            ListTile(
              selected: _selectedIndex == 1,
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () => _selectIndex(1),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () => {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false)
              },
            ),
          ],
        ),
      ),
      body: pages[_selectedIndex],
    );
  }

  _selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context);
    });
  }
}
