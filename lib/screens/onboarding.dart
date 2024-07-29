import 'package:ai_image/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          color: bgcolor,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Image.asset(
                'images/board.png',
                width: width * 0.8,
              ),
              Text(
                'The Best AI Image',
                style: TextStyle(
                    color: whiteclr,
                    fontSize: width * 0.07,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Generator',
                style: TextStyle(
                    color: whiteclr,
                    fontSize: width * 0.07,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'Unlock the magic of your imagination and experience',
                style: TextStyle(
                    color: txtclr,
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'the thrill of bringing your creative visions to life like ',
                style: TextStyle(
                    color: txtclr,
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'never before',
                style: TextStyle(
                    color: txtclr,
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home_Screen()));
                },
                child: Container(
                  height: height * 0.07,
                  width: width * 0.7,
                  decoration: BoxDecoration(
                      color: btnclr, borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'Get Started',
                    style:
                        TextStyle(color: whiteclr, fontWeight: FontWeight.w500),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
