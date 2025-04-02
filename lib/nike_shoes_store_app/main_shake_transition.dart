import 'package:flutter/material.dart';

class MainShakeTransitions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Shake Transition'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              ShakeTransition(
                child: Text(
                  'Hello World',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on TextTheme {
  get headline3 => null;
}

class ShakeTransition extends StatelessWidget {
  const ShakeTransition({
    super.key,
    this.duration = const Duration(milliseconds: 900),
    this.offset = 140.0,
    this.axis = Axis.horizontal,
    required this.child,
  });

  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      child: child,
      duration: duration,
      curve: Curves.elasticOut,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(
                  value * offset,
                  0.0,
                )
              : Offset(0.0, value * offset),
          child: child,
        );
      },
    );
  }
}
