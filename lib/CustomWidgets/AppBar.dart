import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Pages/SearchPage.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,//Color(0xff414342),

      automaticallyImplyLeading: false,
      // leading: InkWell(
      //     onTap: () => Scaffold.of(context).openDrawer(),
      //     child: Icon(Icons.menu,size: 25,color: Color(0xff00afef),)),
      leadingWidth: 0,
      centerTitle: true,
      title: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage(tag: "searchTag"))),
        child: Container(
          margin: EdgeInsets.only(bottom: 5, top: 5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: black.withOpacity(0.05),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "searchTag",
                child: Icon(CupertinoIcons.search, size: 20, color: Colors.black.withOpacity(0.5)),
              ),
              const SizedBox(width: 10),
              Text(
                "Search",
                style: TextStyle(color: black.withOpacity(0.5), fontFamily: "OpenSans", fontSize: 16),
              ),
            ],
          ),
        ),
      ),

      actions: [

        Icon(Icons.shopping_bag_outlined,size: MediaQuery.sizeOf(context).height*0.03,color: Colors.black.withOpacity(0.5),),

        SizedBox(width: MediaQuery.sizeOf(context).width*0.025,),

        InkWell(
            onTap: ()
            {
              Scaffold.of(context).openEndDrawer();
            },
            child: Icon(Icons.menu,size: MediaQuery.sizeOf(context).height*0.03,color: Colors.black.withOpacity(0.5),)),

        SizedBox(width: MediaQuery.sizeOf(context).width*0.05,),

      ],
    );
  }
}
