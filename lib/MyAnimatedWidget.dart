import 'package:flutter/material.dart';

class MyAnimatedWidget extends StatefulWidget {
  @override
  _MyAnimatedWidgetState createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();

    // Create an AnimationController
    _controller = AnimationController(
      vsync:
          this, // Use the vsync property provided by SingleTickerProviderStateMixin
      duration: Duration(seconds: 2),
    );

    // Define a simple Tween animation
    final Animation<double> animation =
        Tween<double>(begin: 0, end: 300).animate(_controller!);

    // Start the animation
    _controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: _controller!,
          builder: (context, child) => Container(
                width: _controller!.value,
                height: _controller!.value,
                color: Colors.blue,
              )),
    );
  }

  @override
  void dispose() {
    _controller!.dispose(); // Dispose of the AnimationController when done
    super.dispose();
  }
}
