import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Headings(BuildContext context,String heading){

  String _Heading = heading;
  return Container(
    padding: const EdgeInsets.only(top: 15,bottom: 10 , left:15 , right:15),
    child: Row(
      children:  [

        Text(_Heading,overflow: TextOverflow.ellipsis,
            style:
             TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.normal,fontFamily: "OpenSans_Bold", fontSize: 18)),
      ],
    ),
  );
}

Widget shadowLine(BuildContext context)
{
  //Shadow Line Container
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 1,
    margin:
    const EdgeInsets.only(left: 0, right: 0),
    decoration: const BoxDecoration(
      color: Color(0xffd0d0d0),
    ),
  );
}

Widget thickBorder(BuildContext context)
{
  return Container(
    margin: const EdgeInsets.only(top: 0,bottom: 0),
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.only(top: 4,bottom: 4),
    color: const Color(0xfff1f1f3),
  );
}