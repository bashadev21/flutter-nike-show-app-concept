import 'package:flutter/material.dart';

class FavWidget extends StatelessWidget {
  const FavWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Favorites',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
