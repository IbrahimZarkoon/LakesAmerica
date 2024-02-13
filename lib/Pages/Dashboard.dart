import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/Constants/colors.dart';
import 'package:lakesamerica/Pages/HomePage.dart';
import 'package:lakesamerica/Pages/ShopPage.dart';
import 'package:lakesamerica/Pages/SignInPage.dart';

import '../CustomWidgets/AppBar.dart';
import '../CustomWidgets/Drawer.dart';
import 'FavoritesPage.dart';
import 'OffersPage.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key, required this.tabindex}) : super(key: key);

  int tabindex;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin{

  final userTabs = [
    HomePage(),
    ShopPage(),
    OffersPage(),
    FavoritesPage(),
    SignInPage()
  ];


  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this,initialIndex: widget.tabindex);
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: showExitConfirmationDialog,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight((_tabController.index == 0 || _tabController.index == 4) ? 0 : kToolbarHeight),
            child: _tabController.index == 3
                ? AppBar(
              automaticallyImplyLeading: false,

              centerTitle: true,
              title: Text(
                "My Favorites",
                style: TextStyle(
                  fontFamily: "OpenSans_Bold",
                  fontSize: MediaQuery.of(context).size.height * 0.022,
                ),
              ),
              backgroundColor: Colors.white,
            )
                : CustomAppBar(),
          ),
          endDrawer: _tabController.index == 3 ? null : Drawer(
            backgroundColor: white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            elevation: 10,
            child: CustomDrawer(),
          ),

          body: RepaintBoundary(
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: userTabs)),

          // floatingActionButton: FloatingActionButton(
          //   onPressed: () { setState(() {
          //     widget.tabindex = 2;
          //     _tabController.animateTo(widget.tabindex);
          //
          //   }); },
          //   backgroundColor: Color(0xff00afef),
          //   child: Icon(Icons.find_in_page),
          // ),


          bottomNavigationBar:  customBottomNavBar(context),
        ),
      ),
    );
  }

  Widget customBottomNavBar(BuildContext context)
  {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffffffff),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 1.5,
                spreadRadius: 0,
                offset: const Offset(0,0)
            )
          ]
      ),
      height: kToolbarHeight,
      child: TabBar(
        dividerColor: const Color(0xfff1f1f1),
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        indicator: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.white,
              width: 3.0,
            ),
          ),
        ),
        controller: _tabController,
        indicatorColor: Colors.white,
        unselectedLabelColor: Colors.black.withOpacity(0.35),
        labelColor:  primaryColor,
        labelStyle:  TextStyle(
            fontSize: MediaQuery.sizeOf(context).height*0.013
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: MediaQuery.sizeOf(context).height*0.011),
        onTap: (int index)
        {
          setState(() {
            widget.tabindex = index;
          });
        },
        tabs: [


          Tab(
            iconMargin: const EdgeInsets.only(bottom: 3),
            icon: widget.tabindex == 0? Icon(CupertinoIcons.home,size: MediaQuery.sizeOf(context).height*0.03) : Icon(CupertinoIcons.home,size: MediaQuery.sizeOf(context).height*0.025,),
            child: const Text("Home"),
          ),
           Tab(
            iconMargin: EdgeInsets.only(bottom: 3),
            icon: widget.tabindex == 1? Icon(Icons.shopify_outlined,size: MediaQuery.sizeOf(context).height*0.03) : Icon(Icons.shopify_outlined,size: MediaQuery.sizeOf(context).height*0.025,),
            text: 'Shop',
          ),
          Tab(
            iconMargin: const EdgeInsets.only(bottom: 3),
            icon: widget.tabindex == 2? Icon(CupertinoIcons.gift_alt_fill,size: MediaQuery.sizeOf(context).height*0.03) : Icon(CupertinoIcons.gift_alt,size: MediaQuery.sizeOf(context).height*0.025,),

            text: 'Offers',
          ),
          Tab(
            iconMargin: const EdgeInsets.only(bottom: 3),
            icon: widget.tabindex == 3? Icon(Icons.favorite,size: MediaQuery.sizeOf(context).height*0.03) : Icon(Icons.favorite_border_outlined,size: MediaQuery.sizeOf(context).height*0.025,),

            text: 'Favorites',
          ),
          Tab(
            iconMargin: const EdgeInsets.only(bottom: 3),
            icon: widget.tabindex == 4? Icon(Icons.person,size: MediaQuery.sizeOf(context).height*0.03) : Icon(Icons.person_outline,size: MediaQuery.sizeOf(context).height*0.025,),

            text: 'Guest',
          ),
        ],
      ),
    );
  }

  Future<bool> showExitConfirmationDialog() async {
    return (await showDialog(
      barrierColor: black.withOpacity(0.75),
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: white,
        surfaceTintColor: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text('Exit Lakes America',style: TextStyle(
            color: primaryColor,fontSize: MediaQuery.sizeOf(context).height*0.026
        ),),
        content: Text('Before leaving make sure all your purchases are complete.',style: TextStyle(
          color: black.withOpacity(0.6),fontSize: MediaQuery.sizeOf(context).height*0.016
        ),),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: primaryColor,
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.2),
                  offset: Offset(0,0),
                  blurRadius: 1.5,
                )
              ]
            ),
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(true), // Exits the app
              child: Text('Stay',style: TextStyle(
                  color: white,fontSize: MediaQuery.sizeOf(context).height*0.016
              ),),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.2),
                    offset: Offset(0,0),
                    blurRadius: 1.5,
                  )
                ]
            ),
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(false), // Cancels the exit
              child: Text('Exit',style: TextStyle(
                  color: secondaryColor,fontSize: MediaQuery.sizeOf(context).height*0.016
              ),),
            ),
          ),
        ],
      ),
    )) ?? false; // If dialog is dismissed by tapping outside, it returns null, which is converted to false
  }
}
