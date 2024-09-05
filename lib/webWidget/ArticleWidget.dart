import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  ArticleWidget(
      {super.key, required this.image, required this.title, this.onClick});

  String image;
  String title;
  VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 200;
    double height = 400;
    return Center(
        child: InkWell(
      onTap: onClick,
      child: Card(
        elevation: 30,
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  image,
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15, left: 20),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
