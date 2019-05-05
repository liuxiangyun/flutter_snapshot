import 'package:flutter/material.dart';

///从透明到不透明
class FadeRouter extends PageRouteBuilder {
  final Widget widget;

  FadeRouter(this.widget)
      : super(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) {
              return widget;
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              //透明度动画
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}

///缩放
class ScaleRouter extends PageRouteBuilder {
  final Widget widget;

  ScaleRouter(this.widget)
      : super(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) {
              return widget;
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              //缩放动画
              return ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}

///旋转加缩放
class RotateScaleRouter extends PageRouteBuilder {
  final Widget widget;

  RotateScaleRouter(this.widget)
      : super(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) {
              return widget;
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation, curve: Curves.fastOutSlowIn)),
                //旋转动画
                child: RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation, curve: Curves.fastOutSlowIn)),
                  child: child,
                ),
              );
            });
}

///右进右出
class RightInRightOutRouter extends PageRouteBuilder {
  final Widget widget;

  RightInRightOutRouter(this.widget)
      : super(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) {
              return widget;
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              //位移动画
              return SlideTransition(
                position: Tween<Offset>(
                        //垂直或水平方向偏移设置
                        begin: Offset(1.0, 0.0),
                        end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animation, curve: Curves.fastOutSlowIn)),
                child: FadeTransition(
                  opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation, curve: Curves.fastOutSlowIn)),
                  child: child,
                ),
              );
            });
}

///下进下出
class BottomInBottomOutRouter extends PageRouteBuilder {
  final Widget widget;

  BottomInBottomOutRouter(this.widget)
      : super(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) {
              return widget;
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              //位移动画
              return SlideTransition(
                position: Tween<Offset>(
                        //垂直或水平方向偏移设置
                        begin: Offset(0.0, 1.0),
                        end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animation, curve: Curves.fastOutSlowIn)),
                child: FadeTransition(
                  opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation, curve: Curves.fastOutSlowIn)),
                  child: child,
                ),
              );
            });
}
