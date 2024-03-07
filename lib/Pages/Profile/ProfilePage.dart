import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/Pages/Dashboard.dart';
import 'package:lakesamerica/Pages/Profile/EditProfile.dart';
import 'package:lakesamerica/Pages/Profile/PaymentInfo.dart';
import 'package:lakesamerica/Pages/Profile/SettingsPage.dart';

import '../../Constants/colors.dart';
import '../../CustomWidgets/OffersPageProductsSlider.dart';
import 'ShippingInfo.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [
          //Profile img, Name, Edit Profile Con
          profileImgNameCon(),

          SizedBox(height: MediaQuery.sizeOf(context).height*0.025,),



          profileCon("Orders",icon: Icons.app_registration,functionIcon: Icons.arrow_forward_ios),
          profileCon("Favorites",icon: Icons.favorite_border,functionIcon: Icons.arrow_forward_ios,onTapFunction: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 3)));
          }),

          SizedBox(height: MediaQuery.sizeOf(context).height*0.025,),
          profileCon("Shipping Information",icon: Icons.home_work_outlined,functionIcon: Icons.arrow_forward_ios,onTapFunction: ()
          {
            Navigator.push(context, CupertinoPageRoute(builder: (_) => ShippingInfo()));
          }),
          profileCon("Payment Information",icon: CupertinoIcons.creditcard,functionIcon: Icons.arrow_forward_ios,onTapFunction: ()
          {
            Navigator.push(context, CupertinoPageRoute(builder: (_) => PaymentInformation()));
          }),

          SizedBox(height: MediaQuery.sizeOf(context).height*0.025,),
          profileCon("Settings",icon: CupertinoIcons.settings_solid,functionIcon: Icons.arrow_forward_ios,onTapFunction: ()
          {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => SettingsPage()));
          }),
          profileCon("Log Out",icon: Icons.logout),

          SizedBox(height: MediaQuery.sizeOf(context).height*0.025,),

          Container(
            color: white,
            child: Column(
              children: [
                Container(
                  padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.025,bottom: MediaQuery.sizeOf(context).height*0.015 , left:MediaQuery.sizeOf(context).height*0.015 , right:MediaQuery.sizeOf(context).height*0.015),
                  child: Row(
                    children:  [

                      Text("Order Again",overflow: TextOverflow.ellipsis,
                          style:
                          TextStyle(color: Colors.black.withOpacity(0.8),fontFamily: "OpenSans_SemiBold",fontWeight: FontWeight.bold, fontSize: MediaQuery.sizeOf(context).height*0.02,)),
                    ],
                  ),
                ),

                OffersPageProductSlider(),
              ],
            ),
          ),

          //Member Since Container
          Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height * 0.015),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Member Since January 2024",
                  style: TextStyle(
                    color: black.withOpacity(0.6),
                    fontFamily: "OpenSans_SemiBold",
                    fontSize: MediaQuery.sizeOf(context).height * 0.014,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget profileImgNameCon()
  {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.05,
          bottom: MediaQuery.sizeOf(context).height * 0.025),
      color: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Profile img Con
          Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.sizeOf(context).height * 0.025),
            width: MediaQuery.sizeOf(context).height * 0.15,
            height: MediaQuery.sizeOf(context).height * 0.15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://i.stack.imgur.com/l60Hf.png"),
                    fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.125),
                      offset: Offset(0, 0),
                      blurRadius: 1,
                      spreadRadius: 0)
                ]),
          ),

          //First / Last Name
          Text(
            "Ibrahim Khan Zarkoon",
            style: TextStyle(
                color: black,
                fontFamily: "OpenSans_SemiBold",
                fontSize: MediaQuery.sizeOf(context).height * 0.025,
                fontWeight: FontWeight.bold),
          ),

          //Email
          Text(
            "ibrahimkhan1120@gmail.com",
            style: TextStyle(
              color: black.withOpacity(0.6),
              fontFamily: "OpenSans_SemiBold",
              fontSize: MediaQuery.sizeOf(context).height * 0.013,
            ),
          ),

          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.025,
          ),

          //Edit Profile Button
          InkWell(
            onTap: ()
            {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => EditProfile()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.sizeOf(context).height * 0.0075),
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width / 2,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        spreadRadius: 1)
                  ]),
              child: Text(
                "Edit Profile",
                style: TextStyle(
                  color: black,
                  fontFamily: "OpenSans_SemiBold",
                  fontSize: MediaQuery.sizeOf(context).height * 0.017,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileCon(String title, {IconData? icon,IconData? functionIcon, Function()? onTapFunction})
  {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.02,horizontal: MediaQuery.sizeOf(context).height*0.025),
        margin: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height*0.0025),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Icon(icon,
              color: black.withOpacity(0.7),size: MediaQuery.sizeOf(context).height*0.03,),

            SizedBox(width: MediaQuery.sizeOf(context).height*0.025,),

            Text(
              title,
              style: TextStyle(
                color: black,
                fontFamily: "OpenSans_SemiBold",
                fontSize: MediaQuery.sizeOf(context).height * 0.017,
              ),
            ),

            Spacer(),

            Icon(functionIcon,
              color: black.withOpacity(0.7),size: MediaQuery.sizeOf(context).height*0.025,),
          ],
        ),
      ),
    );
  }
}
