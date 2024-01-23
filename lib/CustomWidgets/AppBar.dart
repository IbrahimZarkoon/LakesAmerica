import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      leading: InkWell(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: Icon(Icons.menu,size: 25,color: Color(0xff00afef),)),
      leadingWidth: 50,
      centerTitle: true,
      title: Hero(
        tag: "Logo",
        child: SizedBox(
            width: MediaQuery.sizeOf(context).width/2,
            height: kToolbarHeight*1.75,
            child: Image.asset("assets/images/Logo.png",color: Color(0xff00afef),)),
      ),

      bottom: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: InkWell(
          //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage(tag: "searchTag"))),
          child: Container(
            margin: EdgeInsets.only(left: 15,right: 15),
            padding: EdgeInsets.all(10),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black.withOpacity(0.6),width: 1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                Hero(
                    tag: "searchTag",
                    child: Icon(CupertinoIcons.search,size: 20,color: Colors.black.withOpacity(0.6),)),

                const SizedBox(width: 10,),

                Text("Where to?",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 16),)

              ],
            ),
          ),
        ),
      )
    );
  }
}
