import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class ProductDescriptionAcc extends StatefulWidget {
  ProductDescriptionAcc({super.key, required this.title, required this.content});

  String title;
  Widget content;

  @override
  State<ProductDescriptionAcc> createState() => _ProductDescriptionAccState();
}

class _ProductDescriptionAccState extends State<ProductDescriptionAcc> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.02),
      decoration: BoxDecoration(
        // Conditionally show borders based on _isExpanded
        border: Border(
          bottom: BorderSide.none,
          top: BorderSide.none ,
        ),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.all(0),
        childrenPadding: EdgeInsets.all(0),
        shape: Border.all(color: Colors.white),
        title: Text(widget.title,style: TextStyle(
            fontFamily: "OpenSans_SemiBold",
            fontSize: MediaQuery.sizeOf(context).height*0.017,
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
          widget.content
        ],
      ),
    );
  }

}
