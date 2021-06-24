import 'package:flutter/material.dart';

import 'dart:math' as math;

// TODO Make the animation follow horizontal drags in gestureDetector to be super fancy
class FlipAnimation extends StatefulWidget {
  final Widget frontChild;
  final Widget backChild;

  FlipAnimation(this.frontChild, this.backChild);
  @override
  _FlipAnimationState createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateX(math.pi * _animation.value),
        child: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            if (_animationStatus == AnimationStatus.dismissed) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
          },
          child: _animation.value <= 0.5
              ? widget.frontChild
              : Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationX(math.pi),
                  child: widget.backChild),
        ));
  }
}
