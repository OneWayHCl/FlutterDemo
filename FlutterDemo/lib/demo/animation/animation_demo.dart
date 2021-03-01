import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  const AnimationDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animation'),
        elevation: 0.0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  AnimationDemoHome({Key key}) : super(key: key);

  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationDemoController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curved;

  @override
  void initState() {
    super.initState();

    animationDemoController = AnimationController(
        // value: 32.0,
        // lowerBound: 32.0,
        // upperBound: 100.0,
        duration: Duration(milliseconds: 1000),
        vsync: this);

    curved = CurvedAnimation(
        parent: animationDemoController, curve: Curves.bounceInOut);

    animation = Tween(begin: 32.0, end: 80.0).animate(curved);
    animationColor =
        ColorTween(begin: Colors.orange, end: Colors.red[900]).animate(curved);

    animationDemoController.addListener(() {
      setState(() {});
    });

    animationDemoController.addStatusListener((status) {
      print(status);
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedHeart(
            animations: [animation, animationColor],
            controller: animationDemoController,
          ),
          AnimatedHeart(
            animations: [animation, animationColor],
            controller: animationDemoController,
          ),
          AnimatedHeart(
            animations: [animation, animationColor],
            controller: animationDemoController,
          )
        ],
      ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart({this.animations, this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.favorite),
        iconSize: animations[0].value,
        color: animations[1].value,
        onPressed: () {
          switch (controller.status) {
            case AnimationStatus.completed:
              controller.reverse();
              break;
            default:
              controller.forward();
          }
        });
  }
}
