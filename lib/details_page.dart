import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nike_shoes_app/appbar.dart';
import 'package:nike_shoes_app/controller.dart';
import 'package:nike_shoes_app/shoes_model.dart';
import 'package:vector_math/vector_math.dart' as vector;

class DetailsPage extends StatelessWidget {
  final Shoes shoes;
  DetailsPage({Key? key, required this.shoes}) : super(key: key);
  final MyController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    const double itemHeight = 100.0;
    final double itemWidth = size.width / 2;
    _willPopCallback() async {
      _controller.selecteditem.value = 100;
      _controller.sizeselect.value = false;
      _controller.selectedPageIndex.value = 0;

      return true; // return true if the route to be popped
    }

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TweenAnimationBuilder<double>(
            curve: Curves.easeOut,
            tween: Tween(begin: 1.0, end: 0.0),
            duration: const Duration(milliseconds: 600),
            builder: (context, value, child) {
              return Transform.translate(
                  offset: Offset(0.0, value * 50),
                  // offset: Offset(value * 150, 0.0),
                  child: child);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Obx(
                      () => FloatingActionButton(
                        heroTag: 'tag1',
                        onPressed: () {
                          shoes.isFavorite.toggle();
                        },
                        child: shoes.isFavorite.value
                            ? Icon(Icons.favorite, color: Colors.black)
                            : Icon(Icons.favorite_border_outlined,
                                color: Colors.black),
                        backgroundColor: Colors.white,
                      ),
                    )),
                FloatingActionButton(
                  heroTag: 'tag2',
                  onPressed: () {
                    Get.bottomSheet(Container(
                        child: ListView(
                          children: [
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //       decoration: BoxDecoration(
                            //           color: Colors.grey[300],
                            //           borderRadius: BorderRadius.circular(30)),
                            //       height: 10,
                            //       width: 80,
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    child: Center(
                                        child: Hero(
                                            tag: 'tag2',
                                            child:
                                                Image.asset(shoes.image[0]))),
                                    decoration: BoxDecoration(
                                        color: Color(shoes.color),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        shoes.name,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '\$' + shoes.newprice,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                height: 1,
                                color: Colors.black12,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/imgs/feet.png',
                                  height: 25,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Select Size',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GridView.builder(
                                shrinkWrap: true,
                                itemCount: 7,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  childAspectRatio: (itemWidth / itemHeight),
                                ),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                        onTap: () {
                                          _controller.selecteditem.value =
                                              index;
                                          _controller.sizeselect.value = true;
                                        },
                                        child: Obx(
                                          () => AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              curve: Curves.decelerate,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: _controller
                                                              .selecteditem
                                                              .value ==
                                                          index
                                                      ? Colors.black
                                                      : Colors.white),
                                              child: Center(
                                                  child: Text(
                                                'Size $index',
                                                style: TextStyle(
                                                    color: _controller
                                                                .selecteditem
                                                                .value ==
                                                            index
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ))),
                                        )),
                                  );
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      if (_controller.sizeselect.value ==
                                          true) {
                                        Get.back();
                                        Get.snackbar(shoes.name,
                                            'Added to cart successfully',
                                            colorText: Colors.white,
                                            backgroundColor: Colors.black,
                                            duration: const Duration(
                                                milliseconds: 1800),
                                            snackPosition: SnackPosition.TOP);
                                      } else {
                                        Get.back();
                                      }
                                    },
                                    child: Obx(
                                      () => Material(
                                        child: Container(
                                          height: 50,
                                          width: 170,
                                          decoration: BoxDecoration(
                                              color:
                                                  _controller.sizeselect.value
                                                      ? Colors.black
                                                      : Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                              child: Text(
                                            'Add to Cart',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          )),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25))),
                        height: MediaQuery.of(context).size.height * 0.6));
                  },
                  child: const Icon(
                    Icons.add_shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.black87,
                )
              ],
            ),
          ),
        ),
        appBar: const BaseAppBar(
          backicon: true,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                Hero(
                  tag: shoes.color,
                  child: Container(
                    color: Color(shoes.color),
                    height: 300,
                  ),
                ),
                Hero(
                  tag: shoes.moldel,
                  child: Center(
                    child: TweenAnimationBuilder<double>(
                      curve: Curves.easeOut,
                      tween: Tween(begin: 1.0, end: 0.0),
                      duration: const Duration(milliseconds: 500),
                      builder: (context, value, child) {
                        return Transform.translate(
                            offset: Offset(0.0, value * 20),
                            // offset: Offset(value * 150, 0.0),
                            child: child);
                      },
                      child: Text(
                        shoes.moldel,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.03),
                            fontSize: 150,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 250,
                      child: PageView.builder(
                          controller: _controller.pageController,
                          onPageChanged: _controller.selectedPageIndex,
                          physics: const BouncingScrollPhysics(),
                          itemCount: shoes.image.length,
                          itemBuilder: (context, index) {
                            return Hero(
                                tag: index == 0
                                    ? shoes.image[0]
                                    : shoes.image[0] + index.toString(),
                                child: Center(
                                    child: index == 0
                                        ? Transform(
                                            alignment: Alignment.center,
                                            transform: Matrix4.identity()
                                              ..translate(0.0)
                                              ..rotateZ(vector.radians(-20)),
                                            child: Center(
                                                child: TweenAnimationBuilder<
                                                    double>(
                                              curve: Curves.bounceOut,
                                              tween:
                                                  Tween(begin: 1.0, end: 0.0),
                                              duration: const Duration(
                                                  milliseconds: 1000),
                                              builder: (context, value, child) {
                                                return Transform.translate(
                                                    offset: Offset(
                                                        0.0, -value * 20),
                                                    // offset: Offset(value * 150, 0.0),
                                                    child: child);
                                              },
                                              child: Image.asset(
                                                shoes.image[index],
                                                height: 200,
                                              ),
                                            )),
                                          )
                                        : Center(
                                            child: Image.asset(
                                            shoes.image[index],
                                            height: 120,
                                          ))));
                          }),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  left: MediaQuery.of(context).size.width / 2.5,
                  child: Row(
                    children: List.generate(
                      shoes.image.length,
                      (index) => Obx(() {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.decelerate,
                          margin: const EdgeInsets.all(4),
                          width: _controller.selectedPageIndex.value == index
                              ? 10
                              : 6,
                          height: _controller.selectedPageIndex.value == index
                              ? 10
                              : 6,
                          decoration: BoxDecoration(
                            color: _controller.selectedPageIndex.value == index
                                ? Colors.black
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
            TweenAnimationBuilder<double>(
              curve: Curves.elasticOut,
              tween: Tween(begin: 1.0, end: 0.0),
              duration: const Duration(milliseconds: 800),
              builder: (context, value, child) {
                return Transform.translate(
                    offset: Offset(value * 80, 0.0),
                    // offset: Offset(value * 150, 0.0),
                    child: child);
              },
              child: ListTile(
                title: Text(
                  shoes.name.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      shoes.oldprice,
                      style: TextStyle(
                        color: Colors.red.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      '\$' + shoes.newprice,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const ListTile(
              title: Text('Avaliable Size',
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ),
            Container(
                height: 40,
                child: TweenAnimationBuilder<double>(
                  curve: Curves.elasticOut,
                  tween: Tween(begin: 1.0, end: 0.0),
                  duration: const Duration(milliseconds: 500),
                  builder: (context, value, child) {
                    return Transform.translate(
                        offset: Offset(value * 150, 0.0),
                        // offset: Offset(value * 150, 0.0),
                        child: child);
                  },
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Card(
                            elevation: 1,
                            shadowColor: Colors.black26,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Size $index'),
                            )),
                      );
                    },
                  ),
                )),
            const ListTile(
              title: Text('Description',
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ),
            const ListTile(
              title: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
