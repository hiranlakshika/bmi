import 'package:bmi/settings.dart';
import 'package:flutter/material.dart';

import 'bmi.dart';
import 'contact_us.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    late Widget body;

    switch (_selectedIndex) {
      case 0:
        body = Text('Home');
        break;
      case 1:
        body = BMI();
        break;
      case 2:
        body = Settings();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: body,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('BMI App'),
            ),
            ListTile(
              title: Text('Contact Us'),
              leading: Icon(Icons.phone),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactUs()),
              ),
            ),
            ListTile(
              title: Text('Back'),
              leading: Icon(Icons.arrow_back),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
