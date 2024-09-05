import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  VideoWidget({super.key, required this.image, required this.title});
  String image;
  String title;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 360,
      height: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius:
            const BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              image,
              width: 360,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: IconButton(
              iconSize: 60,
              onPressed: () {},
              icon: const Icon(Icons.play_circle),
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 8),
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}