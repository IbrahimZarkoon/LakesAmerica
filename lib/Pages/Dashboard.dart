import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/Constants/colors.dart';

import '../CustomWidgets/AppBar.dart';
import '../CustomWidgets/Drawer.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key, required this.tabindex}) : super(key: key);

  int tabindex;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin{

  final userTabs = [
    Container(width: 100,height: 2000,color: Colors.green,),
    Container(width: 100,height: 2000,color: Colors.red,),
    Container(color: Colors.blue,width: 100,height: 2000),
    Container(color: Colors.grey,width: 100,height: 2000),
    Container(color: Colors.blue,width: 100,height: 2000),


  ];


  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this,initialIndex: widget.tabindex);
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          elevation: 10,
          //clipBehavior: Clip.hardEdge,
          //shadowColor: Colors.black.withOpacity(0.5),
          child:  CustomDrawer(),


        ),

        //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight*2),
          child: CustomAppBar(),
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
    );
  }

  Widget customBottomNavBar(BuildContext context)
  {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffffffff),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 1.5,
                spreadRadius: 0,
                offset: const Offset(0,-1)
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
            icon: widget.tabindex == 1? Icon(Icons.shopping_bag,size: MediaQuery.sizeOf(context).height*0.03) : Icon(Icons.shopping_bag_outlined,size: MediaQuery.sizeOf(context).height*0.025,),
            text: 'Shop',
          ),
          Tab(
            iconMargin: const EdgeInsets.only(bottom: 3),
            icon: widget.tabindex == 2? Icon(Icons.local_offer,size: MediaQuery.sizeOf(context).height*0.03) : Icon(Icons.local_offer_outlined,size: MediaQuery.sizeOf(context).height*0.025,),

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

            text: 'Zarkoon',
          ),
        ],
      ),
    );
  }
}
