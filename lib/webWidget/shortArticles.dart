import 'package:flutter/material.dart';

class ShortArticles extends StatefulWidget {
  final String image;
  final String title;

  const ShortArticles({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  State<ShortArticles> createState() => _ShortArticlesState();
}

class _ShortArticlesState extends State<ShortArticles> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isHovered ? 430 : 400,
        height: isHovered ? 230 : 200,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: isHovered
              ? [
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ]
              : [],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                widget.image,
                width: isHovered ? 430 : 400, // Match the AnimatedContainer width
                height: isHovered ? 230 : 200, // Match the AnimatedContainer height
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 8),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
