import 'package:flutter/material.dart';

import '../../Constants/colors.dart';

class ShippingInfo extends StatefulWidget {
  const ShippingInfo({super.key});

  @override
  State<ShippingInfo> createState() => _ShippingInfoState();
}

class _ShippingInfoState extends State<ShippingInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios,size: MediaQuery.sizeOf(context).height*0.025,color: black.withOpacity(0.8),),
        ),
        backgroundColor: white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Shipping Information",
          style: TextStyle(
            fontFamily: "OpenSans_SemiBold",
            fontWeight: FontWeight.bold,
            color: black,
            fontSize: MediaQuery.of(context).size.height * 0.022,
          ),),
      ),
      body: Center(
        child: Text(
          'NO ADDRESSES SAVED',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: MediaQuery.sizeOf(context).height*0.018,
            color: black.withOpacity(0.7),
            fontFamily: "OpenSans_SemiBold"
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.sizeOf(context).height*0.06,
        alignment: Alignment.center,
        margin: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.025),
        padding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.015),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: primaryColor,width: 0.5),
          color: primaryColor,
        ),
        child: InkWell(
          onTap: () {
            // Functionality to add new address
          },
          child: Text(
            'Add New Address',
            style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.017, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
