///Author: Gal Rom - geromino-apps
///9/11/2020
///https://www.geromino-apps.com
///Feel free to use this code however you like.
///
import 'package:flutter/material.dart';

enum AnimType{
  slideStart, slideBottom, scale, fade, size, rotate
}

/// Helper class to generate an Animated Route for Screens transition
///
/// [destination] (Mandatory) - The Page Widget you would like to navigate to.
///
/// [curve] (Optional) - The curve type - default value is set to [Curves.ease]
///
/// [animType] (Optional) - The type of anim to apply on the AnimatedRoute [AnimType] default value is set to [AnimType.slideStart]
///
/// [duration] (Optional) - The duration of the screen transition in milliseconds, default value is set to 450.
class AnimatedRoute{
  static const int DEFAULT_TRANSITION_DURATION = 450;

  static Route createRoute({Widget destination, Curve curve = Curves.ease, AnimType animType = AnimType.slideStart, int duration = DEFAULT_TRANSITION_DURATION} ){
    return PageRouteBuilder(
        pageBuilder: (context, animation, anotherAnimation) {
          return destination;
        },
        transitionDuration: Duration(milliseconds: duration),
        transitionsBuilder:
            (context, animation, anotherAnimation, child) {
          animation = CurvedAnimation(
              curve: curve, parent: animation);

          switch(animType){
            case AnimType.fade:
              return Align(
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            case AnimType.slideBottom:
              return SlideTransition(
                position: Tween(
                    begin: Offset(0.0, 1.0),
                    end: Offset(0.0, 0.0))
                    .animate(animation),
                child: child,
              );
              break;
            case AnimType.slideStart:
              return SlideTransition(
                position: Tween(
                    begin: Offset(1.0, 0.0),
                    end: Offset(0.0, 0.0))
                    .animate(animation),
                child: child,
              );
              break;
            case AnimType.size:
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
            default:
              return SlideTransition(
                position: Tween(
                    begin: Offset(1.0, 0.0),
                    end: Offset(0.0, 0.0))
                    .animate(animation),
                child: child,
              );

          }
        });
  }
}