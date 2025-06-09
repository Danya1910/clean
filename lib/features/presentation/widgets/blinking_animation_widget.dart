
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class BlinkingAnimationWidget extends StatefulWidget{
  final Widget child;
  final Duration duration;

  const BlinkingAnimationWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  });
  
  @override 
  _BlinkingWidgetState createState() => _BlinkingWidgetState();

}

class _BlinkingWidgetState extends State<BlinkingAnimationWidget>
  with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.1, end: 1.0).animate(_controller);

  }  

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child){
        return Opacity(
          opacity: _animation.value,
          child: widget.child, 
          );
      },
      child: widget.child,
      );
  }
}