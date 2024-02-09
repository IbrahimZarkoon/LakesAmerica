import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/Pages/Dashboard.dart';

import '../Constants/colors.dart';

class HomeScrContainer extends StatefulWidget {
   HomeScrContainer({super.key,required this.title, required this.subHeading,required this.img});

  String title;
  String subHeading;
  String img;

  @override
  State<HomeScrContainer> createState() => _HomeScrContainerState();
}

class _HomeScrContainerState extends State<HomeScrContainer> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  late Animation<double> _Arrowanimation;
  late AnimationController _Arrowcontroller;



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, -0.25)).animate(_controller);

    _controller.forward();

    _Arrowcontroller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _Arrowanimation = Tween(begin: 0.0, end: 1.0).animate(_Arrowcontroller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _Arrowcontroller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _Arrowcontroller.forward();
        }
      });

    _Arrowcontroller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _Arrowcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: ()
        {
          if(widget.title == '') {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 2)));
          }
          else{
            Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 1)));
          }
        },
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.transparent, black.withOpacity(0.6)],
                          stops: [0.5, 0.75],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('${widget.img}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                  bottom: MediaQuery.sizeOf(context).height*0.05,
                right: 0,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).height*0.020),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.title}',
                          style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.03,fontFamily: "OpenSans_SemiBold", color: Colors.white),
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height*0.015,),
                        Text(
                          '${widget.subHeading}',maxLines: 2,
                          style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.02,fontFamily: "OpenSans", color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //
              // Positioned(
              //   right: 20,
              //   top: 20,
              //   child: Container(
              //     alignment: Alignment.center,
              //     padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.02,vertical: MediaQuery.sizeOf(context).height*0.01),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: primaryColor,
              //       border: Border.all(color: primaryColor,width: 2)
              //     ),
              //     child: Text("Skip",style: TextStyle(
              //       color: white,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.018
              //     ),),
              //   ),
              //   // child: AnimatedBuilder(
              //   //   animation: _Arrowanimation,
              //   //   builder: (context, child) {
              //   //     return Transform.translate(
              //   //       offset: Offset( 7.5 * _Arrowanimation.value,0.0),
              //   //       child: Row(
              //   //         children: [
              //   //
              //   //           Text("Explore",style: TextStyle(
              //   //               color: white,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.018
              //   //           ),),
              //   //            Icon(
              //   //             Icons.keyboard_arrow_right,
              //   //             size: MediaQuery.sizeOf(context).height*0.05,
              //   //             color: Colors.white,
              //   //           ),
              //   //         ],
              //   //       ),
              //   //     );
              //   //   },
              //   // ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
