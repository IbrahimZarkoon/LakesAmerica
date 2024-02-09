import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/CustomWidgets/HomeScrContainer.dart';

import '../Constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late PageController _pageController;

  int initialPage = 0;

  @override
  void initState() {
    super.initState();

    // Initialize the PageController
    _pageController = PageController();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose(); // Dispose the PageController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (int index) {
              setState(() {
                initialPage = index;
              });
            },
            controller: _pageController, // Use the PageController here
            scrollDirection: Axis.vertical,
            children: <Widget>[
              HomeScrContainer(
                title: "",
                subHeading: "",
                img: "https://img.freepik.com/free-photo/toy-supermarket-cart-with-red-sale-tablet_23-2147962064.jpg?w=996&t=st=1706531354~exp=1706531954~hmac=678ea698b9a145525d8f2185f18f4a9385bee5688f9ef073c1d0e78535db0738",
              ),
              HomeScrContainer(
                title: "Sporty Elegance",
                subHeading: "Gear Up for Performance and Style",
                img: "https://img.freepik.com/free-photo/brunette-woman-wearing-sport-clothes_329181-13222.jpg?w=996&t=st=1706531164~exp=1706531764~hmac=dfd6a068dd0df2e374c5310210fd898a8596fbc5e28cef1c1fd3ef198914bb7c",
              ),
              HomeScrContainer(
                title: "Gentlemen\'s Collection",
                subHeading: "Elevate Your Wardrobe with Timeless Classics and Contemporary Trends",
                img: "https://img.freepik.com/free-photo/full-length-portrait-handsome-serious-man_171337-17388.jpg?w=996&t=st=1706528290~exp=1706528890~hmac=2d8ff04e131f0ab5625a5ce032c499cae8de422fa2b4b0b82af0a2fff03ccdf2",
              ),
              HomeScrContainer(
                title: "Lakes America\'s Dream Closet",
                subHeading: "Explore the Fusion of Classic and Modern Women's Wear",
                img: "https://img.freepik.com/free-photo/woman-with-shopping-bags-studio-yellow-background-isolated_1303-14286.jpg?w=996&t=st=1706530547~exp=1706531147~hmac=0f50053c85778d6a08921bc15930124a0912d580b82e4129ddff86ec3c40d667",
              ),

            ],
          ),
          //Arrow Bottom Positioned
          initialPage == 3
              ? Positioned(
                  right: 20,
                  left: 20,
                  bottom: 20,
                  child: InkWell(
                    onTap: () {
                      if (initialPage < 3) {
                        _pageController.animateToPage(
                          initialPage + 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                      if (initialPage == 3) {
                        _pageController.animateToPage(
                          initialPage - 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0.0, 20.0 * _animation.value),
                          child: const Icon(
                            Icons.keyboard_arrow_up,
                            size: 50,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                )
              : Positioned(
            right: 20,
            left: 20,
                  bottom: 20,
                  child: InkWell(
                    onTap: () {
                      if (initialPage != 3) {
                        _pageController.animateToPage(
                          initialPage + 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0.0, 20.0 * _animation.value),
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 50,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
