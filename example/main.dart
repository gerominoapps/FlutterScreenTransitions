///Author: Gal Rom - geromino-apps
///9/11/2020
///https://www.geromino-apps.com
///Feel free to use this code however you like.
///
import 'package:flutter/material.dart';

import 'presentation/screens/main/widgets/duration_slider.dart';
import 'presentation/screens/main/widgets/next_screen_button.dart';
import 'presentation/screens/main/widgets/radio_list_tile.dart';
import 'presentation/screens/second/second_screen.dart';
import 'package:route_animation_helper/route_animation_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen Transitions',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Screen Transitions'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const SLIDE_START = 1;
  static const SLIDE_BOTTOM = 2;
  static const FADE = 3;
  static const SCALE = 4;
  static const ROTATION = 5;
  static const CUBIC = 6;

  int _selectedRadioTile;
  double _selectedDuration;
  AnimType _animType;

  @override
  void initState() {
    super.initState();
    _selectedRadioTile = 1;
    _selectedDuration = 450;
    _animType = AnimType.slideStart;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NextScreenButton(onNextScreenIsPressed: onNextScreenPressed),
            SizedBox(
              height: 20,
            ),
            RadioTile(
              text: "Slide Start Transition",
              onSelect: setSelectedRadioTile,
              value: SLIDE_START,
              selectedRadioTileValue: _selectedRadioTile,
            ),
            RadioTile(
              text: "Slide Bottom Transition",
              onSelect: setSelectedRadioTile,
              value: SLIDE_BOTTOM,
              selectedRadioTileValue: _selectedRadioTile,
            ),
            RadioTile(
              text: "Fade Transition",
              onSelect: setSelectedRadioTile,
              value: FADE,
              selectedRadioTileValue: _selectedRadioTile,
            ),
            RadioTile(
              text: "Scale Transition",
              onSelect: setSelectedRadioTile,
              value: SCALE,
              selectedRadioTileValue: _selectedRadioTile,
            ),
            RadioTile(
              text: "Rotation Transition",
              onSelect: setSelectedRadioTile,
              value: ROTATION,
              selectedRadioTileValue: _selectedRadioTile,
            ),
            RadioTile(
              text: "Cubic Transition",
              onSelect: setSelectedRadioTile,
              value: CUBIC,
              selectedRadioTileValue: _selectedRadioTile,
            ),
            SizedBox(
              height: 20,
            ),
            Text('Transition Duration: ${_selectedDuration.round()}millis'),
            DurationSlider(
                duration: _selectedDuration,
                minVal: 200.0,
                maxVal: 2000.0,
                divisions: 18,
                label: _selectedDuration.round().toString(),
                onChange: onDurationSelectionChanged)
          ],
        ),
      ),
    );
  }

  onDurationSelectionChanged(double newValue) {
    setState(() {
      _selectedDuration = newValue;
    });
  }

  setSelectedRadioTile(int val) {
    switch (val) {
      case SLIDE_START:
        _animType = AnimType.slideStart;
        break;
      case SLIDE_BOTTOM:
        _animType = AnimType.slideBottom;
        break;
      case FADE:
        _animType = AnimType.fade;
        break;
      case SCALE:
        _animType = AnimType.scale;
        break;
      case ROTATION:
        _animType = AnimType.rotate;
        break;
      case CUBIC:
        _animType = AnimType.cubic;
        break;
    }
    setState(() {
      _selectedRadioTile = val;
    });
  }

  onNextScreenPressed() {
    // You can also supply the curve param - the default is Curves.ease which in my opinion is the best choice.
    Navigator.of(context).push(RouteAnimationHelper.createRoute(
        // current page is mandatory only if you are using cubic animation.
        currentPage: this.widget,
        destination: Screen2(),
        animType: AnimType.cubic,
        cubicBackgroundColor: Colors.white,
        duration: 400));
  }
}
