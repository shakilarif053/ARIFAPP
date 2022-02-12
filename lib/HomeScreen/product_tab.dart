import 'package:arifapp/widget/custom_action.dart';
import 'package:flutter/material.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({Key key}) : super(key: key);

  @override
  _ProductTabState createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Text('New home'),
          ),
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
