import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  static const routeName = '/myDrawer';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          color: Colors.orange,
          // color: Colors.#94d82d,
          width: double.infinity,
          height: 100,
          alignment: Alignment.centerLeft,
          child: const Text(
            " Settings",
            style: TextStyle(color: Colors.black, fontSize: 40),
          ),
        ),
        ListTile(
          title: Text("Home"),
          leading: Icon(Icons.home, size: 30),
          onTap: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
        SizedBox(
          height: 20,
        ),
        ListTile(
            title: Text("Orders"),
            leading: Icon(
              Icons.add_circle_outline,
              size: 30,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/previousOrders');
            }),
        SizedBox(
          height: 20,
        ),
        ListTile(
            title: Text("Menu"),
            leading: Icon(
              Icons.account_box,
              size: 30,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/menuScreen');
            }),
      ]),
    );
  }
}
