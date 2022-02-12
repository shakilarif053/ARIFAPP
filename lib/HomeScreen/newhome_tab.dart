import 'package:arifapp/widget/custom_action.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class newhome extends StatefulWidget {
  @override
  State<newhome> createState() => _newhomeState();
}

class _newhomeState extends State<newhome> {
  final CollectionReference _productRef =
      FirebaseFirestore.instance.collection('Products');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
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
                          height: 0.0,
                          width: 0.0,
                          child: Center(
                              child: Text('Name: ${document.get('name')}')));
                    }).toList(),
                  );
                }

                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }),
          customaction(
            tittle: 'Home',
            hasTitle: true,
            hasBackarrow: true,
          ),
        ],
      ),
    );
  }
}
