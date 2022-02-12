import 'package:flutter/material.dart';

class customaction extends StatelessWidget {
  final String tittle;
  final bool hasBackarrow;
  final bool hasTitle;
  const customaction({Key key, this.tittle, this.hasBackarrow, this.hasTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _hasBackarrow = hasBackarrow;

    bool _hasTitle = hasTitle;

    return Container(
      padding: EdgeInsets.only(
        top: 30,
        left: 25,
        right: 25,
        bottom: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (hasBackarrow)
            Container(
              child: Icon(Icons.backspace),
            ),
          if (_hasTitle)
            Text(
              tittle,
              style: TextStyle(fontSize: 20),
            ),
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(8)),
              child: Center(child: Text('0')))
        ],
      ),
    );
  }
}
