import 'package:flutter/material.dart';

class drawerpanel extends StatefulWidget {
  const drawerpanel({Key key}) : super(key: key);

  @override
  _drawerpanelState createState() => _drawerpanelState();
}

class _drawerpanelState extends State<drawerpanel> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            child: DrawerHeader(
                child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 55,
                  child: CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 50,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('data')],
                )
              ],
            )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(),
          ),
        ],
      ),
    );
  }
}
