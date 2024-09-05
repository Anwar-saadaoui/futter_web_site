import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_web_site/constants/Colors.dart';
import 'package:news_web_site/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with
  SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(
      const Duration(seconds: 5),
        (){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const MyHomePage(),
            )
        );
        }
    );
  }
  
  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient:LinearGradient( colors: [
            Colors.deepPurple,
            DeepBlue
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:
              const BorderRadius.all(Radius.circular(100)),
              child: Image.asset("images/father.jpeg"),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "الموقع الرسمي للسيد الحبيب سعداوي",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),

    );
  }
}
