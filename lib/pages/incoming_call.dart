import 'dart:math';

import 'package:chatbox/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IncomingCallPage extends StatefulWidget {
  const IncomingCallPage({super.key});

  @override
  _IncomingCallPageState createState() => _IncomingCallPageState();
}

class _IncomingCallPageState extends State<IncomingCallPage> {
  double _width = 400;
  final double _height = 80;
  final double _padding = 5;
  late double _initialWidth;
  bool _hasAnswered = false;

  @override
  void initState() {
    super.initState();
    _initialWidth = _width;
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = _initialWidth / 6;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/incoming_call/background_image.png'),
                fit: BoxFit.fill)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 9,
              ),
              Container(
                width: 126,
                height: 126,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:
                        AssetImage('assets/incoming_call/foreground_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Borsha Akther",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              const Text(
                "Incoming call",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Spacer(
                flex: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.access_time, color: Colors.white),
                      Text("Remind me", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.message, color: Colors.white),
                      Text("Message", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
              const Spacer(flex: 1),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: _hasAnswered
                    ? Align(
                        key: const ValueKey('answered'),
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 60.0),
                          child: Wrap(
                            children: const [],
                          ),
                        ),
                      )
                    : Align(
                        key: const ValueKey('unanswered'),
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(_padding),
                                width: _width,
                                height: _height,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                margin:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 60),
                                child: GestureDetector(
                                  onHorizontalDragEnd: _onDragEnd,
                                  onHorizontalDragUpdate: _onDragUpdate,
                                  child: Stack(
                                    children: [
                                      const Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Slide to Answer',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        width: buttonWidth,
                                        child: const Icon(
                                          CupertinoIcons.phone_fill,
                                          color: Colors.green,
                                          size: 35,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onDragUpdate(DragUpdateDetails details) {
    double buttonWidth = _initialWidth / 6;
    double threshHold = buttonWidth + (_padding * 2);

    var distance = details.delta.distance;

    if (details.delta.dx > 0) {
      _width = max(_width - distance, threshHold);
    } else {
      _width = min(_width + details.delta.distance, _initialWidth);
    }
    setState(() {});
  }

  void _onDragEnd(DragEndDetails details) {
    var threshold = (_initialWidth / 6) + (_padding * 2);

    if (_width >= _initialWidth) return;

    if (_width == threshold) {
      _hasAnswered = true;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              const HomePage(),
        ),
      );
    } else {
      _width = _initialWidth;
    }

    setState(() {});
  }
}
