import 'package:flutter/material.dart';
import 'package:lakesamerica/CustomWidgets/PopularCategories.dart';
import 'package:lakesamerica/CustomWidgets/NewArrivalContainer.dart';
import 'package:lakesamerica/CustomWidgets/TrendingContainer.dart';

import '../Constants/colors.dart';
import '../CustomWidgets/ShopPageProductsGridview.dart';
import '../Routes/PageRoutes.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,

        children: [

          //Free Shipping Widget
          AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: kToolbarHeight/1.5,
            backgroundColor: white,
            elevation: 0,
            title: Text("Free Shipping over \$40",
              style: TextStyle(
                  fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.015
              ),),
            centerTitle: true,
          ),

          //New Jeans Widget
          InkWell(
            onTap: ()
            {
              navigateToAllProductsPage(
                  context,
                  "https://img.freepik.com/free-photo/jeans-closeup_93675-129899.jpg?t=st=1706616401~exp=1706617001~hmac=d299c5e9a20f33e133b11cad5b53c3aa7c9810779c15526c2be9cb20c6888a0c",
                  "Jeans");
            },
            child: Stack(
              children:[
              Container(
                margin: EdgeInsets.only(top: 5),
                width: double.infinity, // Full width of the parent
                height: MediaQuery.sizeOf(context).height *
                    0.1, // Set the height as needed
                foregroundDecoration: BoxDecoration(
                  color: black.withOpacity(0.4)
                  // gradient: LinearGradient(
                    //     colors: [Colors.transparent, black.withOpacity(0.4)],
                    //     stops: [0.2, 0.45],
                    //     begin: Alignment.topCenter,
                    //     end: Alignment.bottomCenter)
                ),

                decoration: BoxDecoration(
                  color: white,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://img.freepik.com/free-photo/jeans-closeup_93675-129899.jpg?t=st=1706616401~exp=1706617001~hmac=d299c5e9a20f33e133b11cad5b53c3aa7c9810779c15526c2be9cb20c6888a0c"),
                    // Replace with your image asset
                    fit: BoxFit
                        .cover, // This ensures the image covers the container
                  ),
                ),
              ),

                Positioned(
                  bottom: 0,top: 0,left: 0,right: 0,
                  child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Explore newest jeans",
                        style: TextStyle(
                          color: white,fontSize: MediaQuery.sizeOf(context).height*0.024,
                          fontWeight: FontWeight.bold, // Optional: change the font weight
                        ),
                      ),
                       SizedBox(width: MediaQuery.sizeOf(context).width*0.025,),
                      Icon(Icons.keyboard_double_arrow_right_outlined,color: white,size: MediaQuery.sizeOf(context).height*0.03,)
                    ],
                  ),
                ),)
            ]
            ),
          ),

          //New Arrival Widget
          NewArrivalContainer(title: "NEW ARRIVALS",
              category: "Denim",
              img: "https://img.freepik.com/free-photo/young-teenage-boy-wearing-denim-outfit_23-2150151061.jpg?w=996&t=st=1706617259~exp=1706617859~hmac=f7fa5ec00605f1620296ecd8ef40b3e7d76d279b800e9d6c7ea50aa704e54d8a"),

          //Popular Categories Slider
          PopularCategories(),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.015),
            child: Text("Seasonal Collection",overflow: TextOverflow.ellipsis,
                style:
                TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.normal,fontFamily: "OpenSans_Bold", fontSize: MediaQuery.sizeOf(context).height*0.025)),
          ),

          TrendingContainer(title: "Hoodies & Sweatshirts",
              shortDesc: "Solid looks for year-round comfort and style.",
              img: "https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F98%2F0b%2F980b003a6064d82faa0884ec5f027b57dbb2bd68.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]"),

          ShopPageProductsGridView()




        ],
      ),
    );
  }
}
