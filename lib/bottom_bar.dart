import 'package:flutter/material.dart';
import 'package:nike_shoes_app/fav.dart';
import 'package:nike_shoes_app/home_page.dart';
import 'package:animations/animations.dart';
import 'package:nike_shoes_app/profile.dart';

import 'appbar.dart';
import 'drawer.dart';

// ignore: must_be_immutable
class BottamBar extends StatefulWidget {
  int currentindex;
  BottamBar({Key? key, required this.currentindex}) : super(key: key);

  @override
  State<BottamBar> createState() => _BottamBarState();
}

class _BottamBarState extends State<BottamBar> {
  static const List<Widget> _widgetOptions = <Widget>[
    FavWidget(),
    HomePage(),
    ProfileWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      drawer: DrawerWidget(),
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: (child, animation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: _widgetOptions.elementAt(widget.currentindex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 6,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black26, spreadRadius: 5, blurRadius: 10),
                  ], color: Colors.black, shape: BoxShape.circle),
                  height: 40,
                  width: 40,
                  child: Hero(
                    tag: 'home',
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  )),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '',
            ),
          ],
          currentIndex: widget.currentindex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
