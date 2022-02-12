import 'package:arifapp/HomeScreen/home_tab.dart';
import 'package:arifapp/HomeScreen/newhome_tab.dart';
import 'package:arifapp/HomeScreen/product_tab.dart';
import 'package:arifapp/HomeScreen/search_tab.dart';
import 'package:arifapp/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;

  List<Widget> bodypage = [
    HomeTab(),
    newhome(),
    ProductTab(),
    SearchTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodypage[page],
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.home),
          Icon(Icons.drafts),
          Icon(Icons.production_quantity_limits),
          Icon(Icons.search),
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) =>
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }), (route) => false));
              },
              icon: Icon(Icons.logout))
        ],
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        index: 0,
        height: 50,
      ),
    );
  }
}
