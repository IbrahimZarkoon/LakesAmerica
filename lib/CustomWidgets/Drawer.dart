import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/Constants/colors.dart';
import 'package:lakesamerica/Routes/PageRoutes.dart';

import '../Pages/Dashboard.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> with SingleTickerProviderStateMixin{
  List<String> depList = [
    "Deals",
    "Easter",
    "Grocery",
    "Home, Furniture & Appliances",
    "Electronics",
    "Beauty",
    "Baby"
  ];

  bool depart = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: white,
        elevation: 0,
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  drawerWidget(),
                  departmentWidget(),
                ],
              ),
            ),

            //Version
            Container(
              margin: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "© Lakes America ",
                            style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.normal,
                                fontSize: MediaQuery.sizeOf(context).height*0.015)),
                        TextSpan(
                            text: "™1.0.0 (15003)",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.normal,
                                fontSize: MediaQuery.sizeOf(context).height*0.015)),
                      ]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget drawerWidget()
  {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
        // image: DecorationImage(
        //     image: AssetImage(
        //         "assets/icon/FBV background image purple.png"),
        //     fit: BoxFit.cover)
      ),
      //width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*.925,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Logo and Signin Row
          Row(
            children: [
              Flexible(
                flex: 3,
                child: InkWell(
                  onTap: ()
                  {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 1)));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.02),
                    height: MediaQuery.sizeOf(context).width/4,
                    //width: MediaQuery.sizeOf(context).width/4,
                    //margin: EdgeInsets.only(top: 33,bottom: 15),
                    //padding: EdgeInsets.only(top: 80,bottom: 40),
                    //height: MediaQuery.of(context).size.height*0.08,
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: AssetImage("assets/images/Logo.png"),
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.contain)),
                  ),
                ),
              ),
              Flexible(
                flex: 4,
                child: GestureDetector(
                  // onTap: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) =>
                  //         const SignIn())),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(7),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child:  Hero(
                      tag: "login",
                      child: Text(
                        "Sign in or create account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "OpenSans_SemiBold",
                            fontSize: MediaQuery.sizeOf(context).height*0.014
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),

          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [

                //Offers & Deals
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 2)));

                    },
                    child: DrawerCon("Offers & Deals", Icon(
                        CupertinoIcons.gift_alt,
                        size: MediaQuery.of(context).size.height * 0.025,
                        color:
                        black
                    ),)
                ),

                //Shop Page
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 1)));

                    },
                    child: DrawerCon("Shop", Icon(
                        Icons.shopify,
                        size: MediaQuery.of(context).size.height * 0.025,
                        color:
                        black
                    ),)
                ),

                //Shadow Line Container
                shadowLine(),

                //Shop By Department
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _tabController.animateTo(1);
                    });
                    //launchURL("https://www.whatsapp.com/");
                  },
                  child:  Container(
                    height: MediaQuery.sizeOf(context).height*0.05,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(5)),
                      contentPadding: const EdgeInsets.all(0),

                      title: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.015,),
                        child: Row(
                          children: [
                            Icon(
                                Icons.category_outlined,
                                size: MediaQuery.of(context).size.height * 0.025,
                                color:
                                black
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.005,
                            ),
                            Text(
                              "Shop by Department",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height * 0.016,
                                  fontFamily: "OpenSans_SemiBold",

                                  color: black),
                            ),

                            Spacer(),

                            Icon(Icons.keyboard_arrow_right,size: MediaQuery.of(context).size.height * 0.025,)


                          ],
                        ),
                      ),
                      style: ListTileStyle.drawer,
                    ),
                  ),
                ),

                //Shadow Line Container
                shadowLine(),


                //MyOrders Container
                GestureDetector(
                    onTap: () {
                      //Navigator.push(context, CupertinoPageRoute(builder: (_) => MyOrdersPage()));

                    },
                    child: DrawerCon("My Orders", Icon(
                        Icons.inventory_outlined,
                        size: MediaQuery.of(context).size.height * 0.025,
                        color:
                        black
                    ))
                ),

                //Wishlist Container
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 3)));

                    },
                    child:  DrawerCon("My Favorites", Icon(
                        Icons.favorite_border_outlined,
                        size: MediaQuery.of(context).size.height * 0.025,
                        color:
                        black
                    ))
                ),

                //My Profile Container
                GestureDetector(
                    onTap: () {
                      //Navigator.push(context, CupertinoPageRoute(builder: (_) => MyOrdersPage()));

                    },
                    child:  DrawerCon("My Profile", Icon(
                        Icons.account_box_outlined,
                        size: MediaQuery.of(context).size.height * 0.025,
                        color:
                        black
                    ))
                ),

                shadowLine(),

                //Help
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 2)));

                    },
                    child: DrawerCon("Help", Icon(
                        CupertinoIcons.question_diamond,
                        size: MediaQuery.of(context).size.height * 0.025,
                        color:
                        black
                    ),)
                ),

                //Shop Page
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 1)));

                    },
                    child: DrawerCon("Customer Service", Icon(
                        Icons.message_outlined,
                        size: MediaQuery.of(context).size.height * 0.025,
                        color:
                        black
                    ),)
                ),

                //Shadow Line Container
                shadowLine(),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget departmentWidget()
  {
    return Container(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.015),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _tabController.animateTo(0);
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).height*0.015, top: MediaQuery.sizeOf(context).height*0.01),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: MediaQuery.sizeOf(context).height*0.02,
                  ),
                   SizedBox(
                    width: MediaQuery.sizeOf(context).height*0.005,
                  ),
                  Text("Shop by Departments",
                      overflow: TextOverflow.ellipsis,
                      style:  TextStyle(
                          color: black,
                          fontFamily: "OpenSans_SemiBold",
                          fontSize: MediaQuery.sizeOf(context).height*0.02)),
                ],
              ),
            ),
          ),

          //Shadow Line Container
          shadowLine(),

          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 0, right: 0),
                itemCount: depList.length ?? 0,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {

                      navigateToAllProductsPage(context, "", depList[index]);
                    },
                    child:  Column(
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height*0.05,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(5)),
                            contentPadding: const EdgeInsets.all(0),

                            title: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.015,),
                              child: Row(
                                children: [
                                  // Icon(
                                  //     Icons.category_outlined,
                                  //     size: MediaQuery.of(context).size.height * 0.025,
                                  //     color:
                                  //     black
                                  // ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.height * 0.005,
                                  ),
                                  Text(
                                    depList[index],
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.height * 0.016,
                                        fontFamily: "OpenSans_SemiBold",

                                        color: black),
                                  ),

                                  Spacer(),

                                  Icon(Icons.keyboard_arrow_right,size: MediaQuery.of(context).size.height * 0.025,)


                                ],
                              ),
                            ),
                            style: ListTileStyle.drawer,
                          ),
                        ),

                        shadowLine(),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }


  Widget DrawerCon(String title, Icon icon)
  {
    return Container(
      height: MediaQuery.sizeOf(context).height*0.05,
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(5)),
        contentPadding: const EdgeInsets.all(0),

        title: Padding(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.015,),
          child: Row(
            children: [
              icon,
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.005,
              ),
              Text(
                "$title",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.017,
                    fontFamily: "OpenSans_SemiBold",

                    color: black),
              ),
            ],
          ),
        ),
        style: ListTileStyle.drawer,
      ),
    );
  }

  Widget shadowLine()
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 1,
      margin:
      const EdgeInsets.only(left: 15, right: 15,top: 15),
      decoration: const BoxDecoration(
        color: Color(0xffd0d0d0),
      ),
    );
  }
}
