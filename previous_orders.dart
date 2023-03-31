import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PreviousOrders extends StatelessWidget {
  const PreviousOrders({super.key});

  static const routeName = '/previousOrders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Previous Orders")),
      body: Text('Your orders will appear hear!'),
    );
  }
}