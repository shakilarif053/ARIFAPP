import 'package:arifapp/screens/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final CollectionReference _productRef =
      FirebaseFirestore.instance.collection("Products");

  Widget newProduct() {
    FutureBuilder<QuerySnapshot>(
        future: _productRef.get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('error:${snapshot.error}'),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              padding: EdgeInsets.only(
                top: 108.0,
                bottom: 12.0,
              ),
              children: snapshot.data.docs.map((document) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  height: 150,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: NetworkImage("${document.get('images')[0]}"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '1st data',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          }

          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  Widget grosseryProduct() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      height: 150,
      width: 130,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2021/03/14/11/14/fish-6093991_960_720.jpg'),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '1st data',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FireBase demo'),
        ),
        endDrawer: drawerpanel(),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2022/01/14/11/12/fishing-6937016_960_720.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('New products'),
                        Text('view all'),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      // newProduct(),
                      // newProduct(),
                      // newProduct(),
                      // newProduct(),
                      // newProduct(),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('New products'),
                        Text('view all'),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      grosseryProduct(),
                      grosseryProduct(),
                      grosseryProduct(),
                      grosseryProduct(),
                      grosseryProduct()
                    ]),
                  ),
                ]))));
  }
}
