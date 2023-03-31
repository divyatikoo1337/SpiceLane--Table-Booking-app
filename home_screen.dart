import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:spice_lane/providers/badge.dart';
import 'package:spice_lane/providers/cart.dart';
import 'package:spice_lane/screens/cart_screen.dart';
import 'package:spice_lane/screens/menu_screen.dart';
import 'package:spice_lane/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});
  final List data = [
    {
      "url":
          "https://images.cdn1.stockunlimited.net/preview1300/restaurant-menu-wallpaper_1807875.jpg",
    },
    {
      "url":
          "https://www.welovesolo.com/wp-content/uploads/vecteezy/55/amhqwwjscu0.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 47, 47, 45),
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Spice Lane"),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, c) => Badge(
              value: cart.itemCount.toString(),
              // child: c,
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
              ),
            ),
            // child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {  },),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                // autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 400),
                height: 200,
              ),
              items: data.map((item) {
                return GridTile(
                  child: Image.network(item["url"], fit: BoxFit.cover),
                  // footer: Container(
                  //     padding: const EdgeInsets.all(15),
                  //     color: Colors.black54,
                  //     // child: Text(
                  //     //   item["title"],
                  //     //   style: const TextStyle(color: Colors.white, fontSize: 20),
                  //     //   textAlign: TextAlign.right,
                  //     // ),
                  //     ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    // margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white)),
                    child: Image.network(
                      'https://wgoqatar.com/wp-content/uploads/2019/09/Master.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: Image.network(
                      'https://s3.scoopwhoop.com/ada/sif/2.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
