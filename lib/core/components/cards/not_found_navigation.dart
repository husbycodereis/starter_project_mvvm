import 'package:flutter/material.dart';

class NotFoundNavigation extends StatefulWidget {
  const NotFoundNavigation({Key? key}) : super(key: key);

  @override
  _NotFoundNavigationState createState() => _NotFoundNavigationState();
}

class _NotFoundNavigationState extends State<NotFoundNavigation> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('not found'),
    );
  }
}
