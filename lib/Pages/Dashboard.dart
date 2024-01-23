import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    Container(color: Colors.grey,width: 100,height: 2000)

  ];


  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this,initialIndex: widget.tabindex);
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


        bottomNavigationBar:  Container(
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
            labelColor:  Color(0xff00afef),
            labelStyle: const TextStyle(
                fontSize: 11
            ),

            onTap: (int index)
            {
              setState(() {
                widget.tabindex = index;
              });
            },
            tabs: [


              Tab(
                iconMargin: const EdgeInsets.only(bottom: 5),
                icon: Icon(widget.tabindex == 0? Icons.home : Icons.home_outlined),
                child: const Text("Home"),
              ),
              const Tab(
                iconMargin: EdgeInsets.only(bottom: 5),
                icon: Icon(CupertinoIcons.search),
                text: 'Explore',
              ),
              Tab(
                iconMargin: const EdgeInsets.only(bottom: 5),
                icon: Icon(widget.tabindex == 2? Icons.favorite :Icons.favorite_border),
                text: 'Saved',
              ),
              Tab(
                iconMargin: const EdgeInsets.only(bottom: 5),
                icon: Icon(widget.tabindex == 3? Icons.card_travel :Icons.card_travel_outlined),
                text: 'Trips',
              ),
            ],
          ),
        ),
      ),
    );
  }

}
