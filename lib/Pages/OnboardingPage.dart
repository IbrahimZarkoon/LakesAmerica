import 'package:flutter/material.dart';
import 'package:lakesamerica/Pages/Dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/colors.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  Future<void> _setOnboarded() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarded', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: <Widget>[
              createPage(
                title: "Welcome to Lakes America",
                content: "Find the best products at unbeatable prices.",
                image: "https://img.freepik.com/free-photo/shopping-concept-with-woman-looking-store-window_23-2147705124.jpg?w=996&t=st=1706191666~exp=1706192266~hmac=685f4d00e1ff1d4dcd1f9efd6793005815fb03423c8ff92f5806ab276acb02d9",
              ),
              createPage(
                title: "Easy and Secure Payment",
                content: "Your payment is secure with our robust system.",
                image: "https://img.freepik.com/free-photo/close-up-hand-holding-device_23-2149241418.jpg?w=996&t=st=1706191525~exp=1706192125~hmac=36d6dfe790f4a10ddf1e150e32527bb7d6e5b97f32459ea56fdb9c64c3c64e07",
              ),
              createPage(
                title: "Fast Delivery",
                content: "Get your products delivered in record time.",
                image: "https://img.freepik.com/free-photo/woman-posing-jumping-while-holding-shopping-bags_23-2148684543.jpg?w=996&t=st=1706191571~exp=1706192171~hmac=53c56242dd67c72f6890a9cff6503dcffaecc5acbac46a0b675c80f02d0ae7d2",
              ),
            ],
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height*0.025,left: MediaQuery.sizeOf(context).height*0.025,right: MediaQuery.sizeOf(context).height*0.025,
            child: InkWell(
              onTap: () {
                // Handle button press, navigate to the main app
                if(_currentPage < 3) {
                  setState(() {
                    _currentPage++;
                    _pageController.animateToPage(_currentPage, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  });
                }
                if(_currentPage == 3) {
                  _setOnboarded().then((_) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage(tabindex: 0)),
                    );
                  });
                }
              },
              child: Container(
                alignment: Alignment.center,
                  padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.015,bottom: MediaQuery.sizeOf(context).height*0.015),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(_currentPage >= 2 ? "Get Started" : "Continue",style: TextStyle(
                    color: white,fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily: "OpenSans_SemiBold"
                  ),)),
            ),
          )
        ],
      ),
    );
  }

  Widget createPage({required String title, required String content, required String image}) {
    return Stack(
      children: [
      Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
        foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.transparent, black],
                stops: [0.5, 0.75],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
        
        Positioned(
          bottom: MediaQuery.sizeOf(context).height*0.15,left: MediaQuery.sizeOf(context).height*0.025,right: MediaQuery.sizeOf(context).height*0.025,

          child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
              fontSize: MediaQuery.sizeOf(context).height*0.03,fontFamily: "OpenSans_Bold",
                color: Colors.white,
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.015),
            Text(
              content,
              textAlign: TextAlign.start,
              style: TextStyle(color: white,
                fontSize: MediaQuery.sizeOf(context).height*0.025,fontFamily: "OpenSans_SemiBold",
              ),
            ),
          ],
        ),)
    ]
    );
  }
}