import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/Colors.dart';
import '../constants/nevItems.dart';

class NavBar extends StatelessWidget {
  NavBar(
      {super.key, required this.width, this.onClickLogo, this.onClickActions});

  double width;
  VoidCallback? onClickLogo;
  VoidCallback? onClickActions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: CupertinoColors.inactiveGray,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(colors: [
            Colors.transparent,
            DeepBlue,
            DarkerButtonBlue,
          ])),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            InkWell(
              onTap: onClickLogo,
              child: Text(
                "Logo",
                style: TextStyle(
                    fontSize: 20,
                    color: TextWhite,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
            const Spacer(),
            ...List.generate(
              navItem.length,
              (index) {
                return TextButton(
                    onPressed: () {},
                    child: Text(
                      navItem[index],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ));
              },
            ),
            const SizedBox(
              width: 30,
            )
          ],
        ),
      ),
    );
  }
}
