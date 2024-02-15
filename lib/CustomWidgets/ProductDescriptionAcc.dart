import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class ProductDescriptionAcc extends StatefulWidget {
  ProductDescriptionAcc({super.key, required this.title});

  String title;

  @override
  State<ProductDescriptionAcc> createState() => _ProductDescriptionAccState();
}

class _ProductDescriptionAccState extends State<ProductDescriptionAcc> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Conditionally show borders based on _isExpanded
        border: Border(
          top: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
          bottom: BorderSide.none ,
        ),
      ),
      child: ExpansionTile(
        shape: Border.all(color: Colors.white),
        title: Text(widget.title,style: TextStyle(
            fontFamily: "OpenSans_SemiBold",
            fontSize: MediaQuery.sizeOf(context).height*0.02,
            fontWeight: _isExpanded? FontWeight.bold : FontWeight.normal,
            color: _isExpanded? secondaryColor : black
        ),),
        iconColor: _isExpanded? secondaryColor : black,
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = !_isExpanded; // Update _isExpanded based on the tile's state
          });
        },
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: 'New Arrival: \n\n',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Swim shorts in patterned seersucker. Drawstring and covered elastic at waistband, side pockets, and a back pocket with hook-loop fastener. Mesh liner shorts.\n\n',
                    style: TextStyle(color: Colors.black),
                  ),

                  TextSpan(
                    text: 'Article number: ',
                    style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.015,fontWeight: FontWeight.bold),

                  ),
                  TextSpan(
                    text: '1216311002\n\n',
                    style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.015,),

                  ),
                  TextSpan(
                    text: 'Length: ',
                    style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.015,fontWeight: FontWeight.bold),

                  ),
                  TextSpan(
                    text: 'Short\n\n',
                    style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.015,),

                  ),
                  TextSpan(
                    text: 'Waist Rise: ',
                    style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.015,fontWeight: FontWeight.bold),

                  ),
                  TextSpan(
                    text: 'Regular waist\n\n',
                    style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.015,),

                  ),
                  TextSpan(
                    text: 'Fit: ',
                    style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.015,fontWeight: FontWeight.bold),

                  ),

                  TextSpan(
                    text: 'Regular fit\n\n',
                    style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.015,),

                  ),
                  TextSpan(
                    text: 'Description: ',
                    style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.015,fontWeight: FontWeight.bold),

                  ),

                  TextSpan(
                    text: 'Black/white, Striped\n\n',
                    style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.015,),

                  ),
                  TextSpan(
                    text: 'Imported: ',
                    style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.015,fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Yes\n',
                    style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.015),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
