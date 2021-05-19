import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool center;
  final bool backicon;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const BaseAppBar(
      {Key? key,
      this.title = 'assets/imgs/nike_logo.png',
      this.center = true,
      this.backicon = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        centerTitle: center,
        title: Image.asset(
          title,
          height: 40,
        ),
        leading: backicon
            ? const BackButton()
            : IconButton(
                icon: const Icon(
                  Icons.sort,
                  color: Colors.black54,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: IconButton(
              onPressed: () {},
              icon: Stack(
                fit: StackFit.expand,
                children: [
                  const Icon(
                    Icons.shopping_cart,
                    size: 26.0,
                  ),
                  Positioned(
                      right: 0,
                      top: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 8,
                        child: Text(
                          '1',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ]);
  }
}
