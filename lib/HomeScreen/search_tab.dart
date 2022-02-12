import 'package:arifapp/widget/custom_action.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Text('New home'),
          ),
          customaction(
            hasBackarrow: true,
            tittle: 'Home',
            hasTitle: false,
          ),
        ],
      ),
    );
  }
}
