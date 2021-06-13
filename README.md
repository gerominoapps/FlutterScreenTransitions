# screen_transitions

Animate routes easily with AnimatedRoute Helper class.

## Getting Started

Flutter allows you to use pre-defined global transitions for example:

```dart
MaterialApp(
   theme: ThemeData(
   pageTransitionsTheme: PageTransitionsTheme(builders: {
   TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
   TargetPlatform.android: CupertinoPageTransitionsBuilder(),
   }),
...
)
```

You can customize transitions by supplying your own route, I have implemented a simple helper with pre-defined routes to make your life a bit easier.

```dart
Navigator.of(context).push(RouteAnimationHelper.createRoute(buildContext : context, destination : Screen2(), animType: AnimType.slideStart);
```

You choose one of the following types: 
```dart
enum AnimType{
  slideStart, slideBottom, scale, size, fade, rotate, cubic
}
```

Note that for cubic you must supply currentPage param.
```dart
Navigator.of(context).push(RouteAnimationHelper.createRoute(buildContext : context, currentPage: Screen1(), destination : Screen2(), animType: AnimType.cubic);
```

![](AnimatedRoute.gif)

You can also supply a curve although Curves.ease - which is the default - is the best IMHO

- [Comments/Questions? contact me](https://www.geromino-apps.com)

