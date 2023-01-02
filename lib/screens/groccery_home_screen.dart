import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GroceryHomeScreen extends StatefulWidget {
  const GroceryHomeScreen({Key? key}) : super(key: key);

  @override
  State<GroceryHomeScreen> createState() => _GroceryHomeScreenState();
}

class _GroceryHomeScreenState extends State<GroceryHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation, animation1, menuAnimation;
  Animation<Color>? animation2;
  bool animatedbool = false;
  double menuWidth = 150;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    menuAnimation =
        Tween<double>(begin: -200, end: 0).animate(animationController!);
    animation = Tween<double>(begin: 0, end: 200).animate(animationController!);
    animation1 = Tween<double>(begin: 1, end: .7).animate(animationController!);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: animation!,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(animation!.value, 0),
                    child: Transform.scale(
                      scale: animation1!.value,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.green,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          AnimatedBuilder(
            animation: menuAnimation!,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(menuAnimation!.value, 0),
                child: Container(
                  width: 200,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(right: BorderSide(width: 1))
                  ),
                ),
              );
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 24,
                bottom: 24,
                left: 15,
                right: 15),
            color: Colors.pink,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print("object");
                    if (animatedbool == false) {
                      animationController!.forward();
                    } else
                      animationController!.reverse();
                    setState(() {
                      animatedbool = !animatedbool;
                    });
                  },
                  child: Container(
                    child:
                        FaIcon(FontAwesomeIcons.calendar, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
