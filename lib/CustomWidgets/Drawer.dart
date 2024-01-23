import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Pages/Dashboard.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  bool companyAcc = false;
  bool homeownerACC = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15,bottom: 15),
      height: MediaQuery.sizeOf(context).height,
      color: Color(0xff414342),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [

          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Icon(Icons.close,color: Colors.white,size: 20,)
                ],
              ),
            ),
          ),

          Container(
            height: MediaQuery.sizeOf(context).height*0.15,
              child: Image.asset("assets/images/Logo.png",color: Colors.white,)
          ),

          InkWell(
              onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => DashboardPage(tabindex: 0))),
              child: drawerCon("HOME")),

          drawerAcc(
            "COMPANY",
            companyAcc,
            [
              drawerSubCon("ABOUT US",false),
              drawerSubCon("CAREERS",false),
              drawerSubCon("INTERIOR DESIGN SERVICES",true),
            ]
          ),

          drawerCon("FIND A PROPERTY"),

          drawerAcc(
              "FOR HOMEOWNERS",
              homeownerACC,
              [
                drawerSubCon("PROPERTY MANAGEMENT",false),
                drawerSubCon("LANDLORD PORTAL",false),
                drawerSubCon("FAQ",true),
              ]
          ),

          drawerCon("CONTACT US"),




        ],
      ),
    );
  }
  
  Widget drawerCon(String title)
  {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white,width: 0.5))
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(title,style: TextStyle(color: Colors.white,fontSize: 14),)
        ],
      ),
    );
  }

  Widget drawerSubCon(String title,bool islast)
  {
    return Container(
      decoration: islast? BoxDecoration() : BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white,width: 0.5))
      ),
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(title,style: TextStyle(color: Colors.white,fontSize: 12),)
        ],
      ),
    );
  }

  Widget drawerAcc(String title,bool _isExpanded, List<Widget> subCon)
  {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white,width: 0.5))
      ),
      child: ExpansionTile(
        //childrenPadding: EdgeInsets.all(20),
        tilePadding: EdgeInsets.only(right: 15),
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 15,bottom: 15,left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(title,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.normal),)
            ],
          ),
        ),
        children: subCon,
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
      ),
    );
  }
}
