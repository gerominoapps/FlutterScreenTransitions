///Author: Gal Rom - geromino-apps
///9/11/2020
///https://www.geromino-apps.com
///Feel free to use this code however you like.
///
import 'package:flutter/material.dart';
import 'dart:math';

/// enum representing the selected animation type you want to apply
/// 
/// [AnimType.slideStart] - enter the next screen sliding from the side of the screen.
/// [AnimType.slideBottom] - enter the next screen from the bottom of the screen.
/// [AnimType.scale] - opens the next screen from the middle of the screen and expanding to the top and bottom of the screen.
/// [AnimType.fade] - opens the next screen by fading it in.
/// [AnimType.rotate] - rotates the next screen 360 degrees.
/// [AnimType.cubic] - 3D cubic animation between screens.
enum AnimType { slideStart, slideBottom, scale, fade, rotate, cubic }

/// Helper class to generate an Animated Route for Screens transition
///
/// [currentPage] (Mandatory only for [AnimType.cubic]).
///
/// [destination] (Mandatory) - The Page Widget you would like to navigate to.
///
/// [curve] (Optional) - The curve type - default value is set to [Curves.ease]
///
/// [animType] (Optional) - The type of anim to apply on the AnimatedRoute [AnimType] default value is set to [AnimType.slideStart]
///
/// [duration] (Optional) - The duration of the screen transition in milliseconds, default value is set to 450.
///
/// [cubicBackgroundColor] (Optional) - The background color for the cubic animation - default value: [Colors.white]
class RouteAnimationHelper {
  static const int DEFAULT_TRANSITION_DURATION = 450;

  static Route createRoute(
      {Widget currentPage, Widget destination,
      Curve curve = Curves.ease,
      AnimType animType = AnimType.slideStart,
      int duration = DEFAULT_TRANSITION_DURATION, Color cubicBackgroundColor = Colors.white}) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, anotherAnimation) {
          return animType == AnimType.cubic ? currentPage : destination;
        },
        transitionDuration: Duration(milliseconds: duration),
        transitionsBuilder: (context, animation, anotherAnimation, child) {
          animation = CurvedAnimation(curve: curve, parent: animation);
          
          switch (animType) {
            case AnimType.fade:
              return Align(
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            case AnimType.slideBottom:
              return SlideTransition(
                position: Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                    .animate(animation),
                child: child,
              );
              break;
            case AnimType.slideStart:
              return SlideTransition(
                position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation),
                child: child,
              );
              break;
            case AnimType.scale:
              return Align(
                child: SizeTransition(
                  sizeFactor: animation,
                  child: child,
                  axisAlignment: 0.0,
                ),
              );
              break;
            case AnimType.rotate:
              return RotationTransition(
                turns: animation,
                child: child,
              );
            case AnimType.cubic:
              
              if(currentPage == null){
                print('RouteAnimationHelper, currentPage param is mandatory for cubic transition...');
                return SlideTransition(
                  position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                      .animate(animation),
                  child: child,
                ); 
              }
              
              return Stack(
                children: <Widget>[
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset.zero,
                      end: Offset(-1.0, 0.0),
                    ).animate(animation),
                    child: Container(
                      color: cubicBackgroundColor,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.003)
                          ..rotateY(pi / 2 * animation.value),
                        alignment: FractionalOffset.centerRight,
                        child: currentPage,
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: Container(
                      color: cubicBackgroundColor,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.003)
                          ..rotateY(pi / 2 * (animation.value - 1)),
                        alignment: FractionalOffset.centerLeft,
                        child: destination,
                      ),
                    ),
                  )
                ],
              );
            default:
              return SlideTransition(
                position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation),
                child: child,
              );
          }
        });
  }
}
