import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nike_shoes_app/controller.dart';
import 'package:nike_shoes_app/shoes_model.dart';
import 'package:vector_math/vector_math.dart' as vector;

import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  final MyController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: shoselist.length,
            itemBuilder: (context, index) {
              final shoe = shoselist[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 700),
                            pageBuilder: (context, animation, ___) {
                              return FadeTransition(
                                  opacity: animation,
                                  child: DetailsPage(shoes: shoe));
                            }));
                  },
                  child: Stack(
                    children: [
                      Hero(
                        tag: shoe.color,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(shoe.color),
                              borderRadius: BorderRadius.circular(18)),
                          height: 320,
                          width: size.width * 0.9,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Hero(
                        tag: shoe.moldel,
                        flightShuttleBuilder: _flightShuttleBuilder,
                        child: Center(
                          child: Text(
                            shoe.moldel,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.03),
                                fontSize: 150,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Hero(
                            tag: shoe.image[0],
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..translate(0.0)
                                ..rotateZ(vector.radians(-20)),
                              child: Center(
                                  child: Image.asset(
                                shoe.image[0],
                                height: 200,
                              )),
                            ),
                          ),
                          Text(
                            shoe.name,
                            style: TextStyle(
                                color: Colors.black87.withOpacity(0.7),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            shoe.oldprice,
                            style: TextStyle(
                              color: Colors.red.withOpacity(0.7),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            '\$' + shoe.newprice,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 25,
                        left: 25,
                        child: InkWell(
                            onTap: () {
                              shoe.isFavorite.toggle();
                            },
                            child: Obx(
                              () => Container(
                                child: shoe.isFavorite.value
                                    ? Icon(Icons.favorite)
                                    : Icon(Icons.favorite_border_outlined),
                              ),
                            )),
                      ),
                      Positioned(
                          bottom: 25,
                          right: 25,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.add_shopping_cart_outlined,
                                color: Colors.black54,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              );
            }),
      )
          // body:  ListView.builder(itemBuilder: ),
          ),
    );
  }

  Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
    );
  }
}
