import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LogoWidget extends StatefulWidget {
  @override
  _LogoWidgetState createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeOut)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  // Widget build(BuildContext context) => _AnimatedLogo(animation: animation);
  Widget build(BuildContext context) =>
      _GrowTransition(child: _Logo(), animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _AnimatedLogo extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: .1, end: 1);
  static final _scaleTween = Tween<double>(begin: 0, end: 1);
  _AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Transform(
        alignment: FractionalOffset.center,
        transform: new Matrix4.identity()..scale(_scaleTween.evaluate(animation)),
        child: Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 200,
            width: 200,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 200,
        width: 200,
        child: FlutterLogo(),
      );
}

class _GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  static final _opacityTween = Tween<double>(begin: .1, end: 1);
  static final _scaleTween = Tween<double>(begin: 0, end: 1);

  _GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    print('build grow $child, $animation');
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Transform(
              alignment: FractionalOffset.center,
              transform: new Matrix4.identity()
                ..scale(_scaleTween.evaluate(animation)),
              child: Opacity(
                  child: child, opacity: _opacityTween.evaluate(animation)),
            ),
        child: child,
      ),
    );
  }
}
