import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:news_web_site/constants/Colors.dart';
import 'package:news_web_site/constants/articles.dart';
import 'package:news_web_site/constants/icons.dart';
import 'package:news_web_site/splashScreen/splashScreen.dart';
import 'package:news_web_site/webWidget/ArticleWidget.dart';
import 'package:news_web_site/webWidget/shortArticles.dart';
import 'package:news_web_site/webWidget/videoWidget.dart';
import 'webWidget/NavBar.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          // navbar
          NavBar(
            width: width,
          ),

          Container(
            padding: const EdgeInsets.all(25),
            width: width,
            height: height - 130,
            child: GridView.builder(
              itemCount: articles.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 25,
                mainAxisSpacing: 25,
                childAspectRatio: 2.1,
              ),
              itemBuilder: (_, index) {
                return ShortArticles(
                    image: articles[index].image, title: articles[index].title);
              },
            ),
          ),

          // Articles and maybe ads
          Container(
            width: width,
            height: 841,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(
                      "Trending",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                //ads
                Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index, realIndex) => ArticleWidget(
                          image: articles[index].image,
                          title: articles[index].title),
                      options: CarouselOptions(
                        aspectRatio: 2.0,
                        autoPlay: true,
                        autoPlayAnimationDuration: const Duration(seconds: 2),
                        enlargeCenterPage: true,
                        autoPlayCurve: Curves.easeInOut,
                        pauseAutoPlayInFiniteScroll: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentPage = index;
                          });
                        },
                      ),
                    ),
                    buildCarouselIndicator(),
                  ],
                ),
              ],
            ),
          ),

          // video
          Container(
            width: width,
            height: height,
            color: CupertinoColors.inactiveGray,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      "Videos",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                // video widget
                Container(
                  height: height - 80,
                  padding: const EdgeInsets.all(8),
                  child: GridView.builder(
                    itemCount: articles.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (_, index) {
                      return VideoWidget(
                          image: articles[index].image,
                          title: articles[index].title);
                    },
                  ),
                )
              ],
            ),
          ),

          // contact and social media
          SizedBox(
            width: width,
            height: 270,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        child: Image.asset(
                          "images/father.jpeg",
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "email: example@gmail.com",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    ...List.generate(
                      4,
                      (index) => Container(
                        child: IconButton(onPressed: () {}, icon: icons[index]),
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "الموقع الرسمي للسيد الحبيب سعداوي",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < articles.length; i++)
          Container(
            margin: const EdgeInsets.all(10),
            height: 10,
            width: i == currentPage ? 20 : 10,
            decoration: BoxDecoration(
                color: i == currentPage ? Colors.red : DeepBlue,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
          )
      ],
    );
  }
}
