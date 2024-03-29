import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/Pages/AllProductsPage.dart';

import '../Constants/colors.dart';
import '../Routes/PageRoutes.dart';

class NewArrivalContainer extends StatelessWidget {
  const NewArrivalContainer({super.key, required this.title, required this.category, required this.img});

  final String title;
  final String category;
  final String img;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        navigateToAllProductsPage(context,img,title);
      },
      child: Stack(
            children:[
              Container(
                margin: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.05),
                width: double.infinity, // Full width of the parent
                height: MediaQuery.sizeOf(context).height*0.425,
                foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.transparent, black.withOpacity(0.6)],
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
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                left: 0,right: 0,bottom: MediaQuery.sizeOf(context).height*0.075,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$title".toUpperCase(),
                      style: TextStyle(
                        letterSpacing: 7,
                        color: white,fontSize: MediaQuery.sizeOf(context).height*0.02,
                        fontFamily: "OpenSans_SemiBold", // Optional: change the font weight
                      ),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height*0.005,),
                    Text(
                      "$category",
                      style: TextStyle(
                        color: white,fontSize: MediaQuery.sizeOf(context).height*0.028,
                        fontFamily: "OpenSans_Bold", // Optional: change the font weight
                      ),
                    ),
                  ],
                ),)
            ]
        ),
    );
  }
}
