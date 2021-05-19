import 'package:get/get.dart';

class Shoes {
  final String name;
  final String newprice;
  final List<String> image;
  final String oldprice;
  final String moldel;
  final int color;

  Shoes(
      {required this.name,
      required this.newprice,
      required this.image,
      required this.oldprice,
      required this.moldel,
      required this.color});
  final isFavorite = false.obs;
}

var shoselist = [
  Shoes(
    name: 'Nike gene',
    newprice: '1222',
    image: [
      'assets/imgs/shoes1_1.png',
      'assets/imgs/shoes1_2.png',
      'assets/imgs/shoes1_3.png'
    ],
    oldprice: '1500',
    moldel: '275',
    color: 0xFFF6F6F6,
  ),
  Shoes(
    name: 'Nike solo',
    newprice: '1004',
    image: [
      'assets/imgs/shoes2_1.png',
      'assets/imgs/shoes2_2.png',
      'assets/imgs/shoes2_3.png'
    ],
    oldprice: '1600',
    moldel: '89',
    color: 0xFFFCF5EB,
  ),
  Shoes(
    name: 'Nike cale',
    newprice: '1233',
    image: [
      'assets/imgs/shoes3_1.png',
      'assets/imgs/shoes3_2.png',
      'assets/imgs/shoes3_3.png'
    ],
    oldprice: '1800',
    moldel: '140',
    color: 0xFFFEEFEF,
  ),
  Shoes(
    name: 'Nike pake',
    newprice: '999',
    image: [
      'assets/imgs/shoes4_1.png',
      'assets/imgs/shoes4_2.png',
      'assets/imgs/shoes4_3.png'
    ],
    oldprice: '1100',
    moldel: '33',
    color: 0xFFEDF3FE,
  ),
];
