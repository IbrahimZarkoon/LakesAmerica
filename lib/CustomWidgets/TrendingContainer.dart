import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/CustomWidgets/PriceTag.dart';

import '../Constants/colors.dart';

class TrendingContainer extends StatelessWidget {
  const TrendingContainer({super.key, required this.title, required this.shortDesc, required this.img});
  final String title;
  final String shortDesc;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Container(
            margin: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.025),
            width: double.infinity, // Full width of the parent
            height: MediaQuery.sizeOf(context).height*0.425,
            foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, black.withOpacity(0.1)],
                    stops: [0.5, 0.75],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            decoration: BoxDecoration(
              color: white,

            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0, // Padding from the bottom
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Image.network(
                    "$img",
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
              left: 15,
              top: MediaQuery.sizeOf(context).height*0.175,
              child: PriceTag(price: "19.99")),

          Positioned(
            left: 0,right: 0,bottom: MediaQuery.sizeOf(context).height*0.075,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$title",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    letterSpacing: 2,
                    color: black,fontSize: MediaQuery.sizeOf(context).height*0.026,
                    fontFamily: "OpenSans_Bold", // Optional: change the font weight
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
                Text(
                  "$shortDesc",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    color: black,fontSize: MediaQuery.sizeOf(context).height*0.017,
                    fontFamily: "OpenSans_SemiBold", // Optional: change the font weight
                  ),
                ),
              ],
            ),)
        ]
    );
  }
}
