import 'package:chatapp/components/button/colorizedButton/colorizedButton.dart';
import 'package:chatapp/global.dart';
import 'package:flutter/material.dart';

class Unsigned extends StatefulWidget {
  const Unsigned({Key? context}) : super(key: context);

  @override
  State<Unsigned> createState() => _UnsignedState();
}

class _UnsignedState extends State<Unsigned> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: AppScreen(context).screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/ill-chat.png'),
            const Text(
              'Connected with your friend anywhere and anytime',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const CircleStep(active: true,),
                  const CircleStep(active: false,),
                  const CircleStep(active: false,),
                  const CircleStep(active: false,),
                ],
              ),
            ),
            ColorizedButton(text: "Create Account", color: AppColor.primary, width: 182, height: 48,),
            RichText(text: TextSpan(text: "Have an account?", style: TextStyle(color: AppColor.black), children: [TextSpan(text: " Sign In", style: TextStyle(color: AppColor.primary))])),
          ],
        ),
      ),
    );
  }
}

class CircleStep extends StatelessWidget {
  final bool active;
  const CircleStep({Key? key, this.active = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentColor = active ? AppColor.primary : Colors.blueGrey.shade200;
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
          color: currentColor, borderRadius: BorderRadius.circular(4)),
    );
  }
}
