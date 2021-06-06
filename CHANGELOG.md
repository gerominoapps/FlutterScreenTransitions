#### [1.0.0+5] - Added Size Animation.

#### [1.0.0+4] - Added Cubic Animation.

To use it you need to supply the current screen, you can also change the background color of the transition.
```dart
Navigator.of(context).push(RouteAnimationHelper.createRoute(
        // current page is mandatory only if you are using cubic animation.
        currentPage: this.widget,
        destination: Screen2(),
        animType: AnimType.cubic,
        cubicBackgroundColor: Colors.white));
  }
)
```


#### [1.0.0+3] - Corrected Indentation

#### [1.0.0+2] - Added Dart docs.

#### [1.0.0+1] - Release.
* First Version, Included 5 transitions types: slideStart, slideBottom, scale, fade, rotate