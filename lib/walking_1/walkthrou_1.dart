import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class WalkThrough1 extends StatefulWidget {
  @override
  _WalkThrough1State createState() => _WalkThrough1State();
}

class _WalkThrough1State extends State<WalkThrough1> {
  Color _bdColor = Color.fromRGBO(45, 50, 97, 1);
  Color _textColor = Color.fromRGBO(74, 74, 74, 1);
  PageController _pageController;
  ValueNotifier _pageIndexNotifier = ValueNotifier<int>(0);
  double _marginRightLeft;
  double _marginTop;
  double _pageHeight;

  final images = [
    'assets/images/success.jpeg',
    'assets/images/success.jpeg',
    'assets/images/success.jpeg',
    'assets/images/success.jpeg',
  ];
  final title = [
    'What will you do first ',
    'What will you do second ',
    'What will you do third ',
    'What will you do fourth ',
  ];
  final description = [
    "I'm usama elgindy , how are tou it's for test only 'one'",
    "I'm usama elgindy , how are tou it's for test only 'two'",
    "I'm usama elgindy , how are tou it's for test only 'three'",
    "I'm usama elgindy , how are tou it's for test only 'four'",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: _pageIndexNotifier.value,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _marginRightLeft = MediaQuery.of(context).size.width * 0.1;
    _marginTop = MediaQuery.of(context).size.width * 0.3;
    _pageHeight = MediaQuery.of(context).size.height * .60;
    return Scaffold(
      body: Container(
        color: _bdColor,
        child: Column(
          children: <Widget>[
            Flexible(
              child: PageView.builder(
                onPageChanged: (index) {
                  _pageIndexNotifier.value = index;
                },
                controller: _pageController,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: _pageHeight,
                        color: Colors.white,
                        margin: EdgeInsets.only(
                          left: _marginRightLeft,
                          right: _marginRightLeft,
                          top: _marginTop,
                        ),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              images[index],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 24.0, bottom: 24),
                              child: Text(
                                title[index],
                                style: TextStyle(
                                  color: _textColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16,
                              ),
                              child: Text(
                                description[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: _textColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                itemCount: 4,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.only(left: _marginRightLeft, bottom: 32),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: PageViewIndicator(
                    indicatorPadding: EdgeInsets.all(1),
                    pageIndexNotifier: _pageIndexNotifier,
                    length: 4,
                    normalBuilder: (animationController, index) => Circle(
                      size: 8.0,
                      color: Colors.grey,
                    ),
                    highlightedBuilder: (animationController, index) =>
                        ScaleTransition(
                      scale: CurvedAnimation(
                        parent: animationController,
                        curve: Curves.ease,
                      ),
                      child: Circle(
                        size: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  padding: EdgeInsets.only(right: _marginRightLeft, bottom: 32),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.decelerate);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
