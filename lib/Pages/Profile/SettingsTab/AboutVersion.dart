import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';

class AboutVersion extends StatefulWidget {
  const AboutVersion({super.key});

  @override
  State<AboutVersion> createState() => _AboutVersionState();
}

class _AboutVersionState extends State<AboutVersion> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios,size: MediaQuery.sizeOf(context).height*0.025,color: black.withOpacity(0.8),),
        ),
        centerTitle: true,
        title: Text("About This Version",
          style: TextStyle(
            fontFamily: "OpenSans_SemiBold",
            fontWeight: FontWeight.bold,
            color: black,
            fontSize: MediaQuery.of(context).size.height * 0.022,
          ),),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            //Logo Con
            Center(
              child: Container(
                padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.02),
                height: MediaQuery.sizeOf(context).height*0.225,
                width: MediaQuery.sizeOf(context).height*0.225,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Image.asset("assets/images/Logo.png",fit: BoxFit.scaleDown,),
              ),
            ),

            SizedBox(height: MediaQuery.sizeOf(context).height*0.025,),

            //Version Number
            Text("Version 24.14.1",
            style: TextStyle(
              color: black.withOpacity(0.7),
              fontFamily: "OpenSans_SemiBold",
              fontSize: MediaQuery.sizeOf(context).height*0.019,
              fontWeight: FontWeight.bold
            ),),

            SizedBox(height: MediaQuery.sizeOf(context).height*0.005,),

            //Build Number
            Text("Build: 240209129",
              style: TextStyle(
                  color: black.withOpacity(0.7),
                  fontFamily: "OpenSans_SemiBold",
                  fontSize: MediaQuery.sizeOf(context).height*0.013,
              ),),

            SizedBox(height: MediaQuery.sizeOf(context).height*0.025,),

            Text("Copyright 2024 LakesAmerica, Inc.",
              style: TextStyle(
                color: black.withOpacity(0.7),
                fontFamily: "OpenSans_SemiBold",
                fontSize: MediaQuery.sizeOf(context).height*0.013,
              ),),
            Text("All Rights Reserved",
              style: TextStyle(
                color: black.withOpacity(0.7),
                fontFamily: "OpenSans_SemiBold",
                fontSize: MediaQuery.sizeOf(context).height*0.013,
              ),),
          ],
        ),
      ),
    );
  }
}
