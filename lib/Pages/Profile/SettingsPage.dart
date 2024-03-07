import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/CustomWidgets/CustomSnackBar.dart';
import 'package:lakesamerica/Pages/Profile/SettingsTab/AboutVersion.dart';
import 'package:lakesamerica/Pages/Profile/SettingsTab/PrivacyPolicy.dart';
import 'package:lakesamerica/Pages/Profile/SettingsTab/SelectCountry.dart';
import 'package:lakesamerica/Pages/Profile/SettingsTab/SelectCurrency.dart';
import 'package:lakesamerica/Pages/Profile/SettingsTab/SelectLanguage.dart';
import 'package:lakesamerica/Pages/Profile/SettingsTab/TermsOfSale.dart';
import 'package:lakesamerica/Pages/Profile/SettingsTab/TermsOfUse.dart';

import '../../Constants/colors.dart';
import '../ShippingandReturnsPage.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            size: MediaQuery.sizeOf(context).height * 0.025,
            color: black.withOpacity(0.8),
          ),
        ),
        backgroundColor: white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontFamily: "OpenSans_SemiBold",
            fontWeight: FontWeight.bold,
            color: black,
            fontSize: MediaQuery.of(context).size.height * 0.022,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.001,
          ),
          settingsCon("Country/Region",
              icon: CupertinoIcons.globe,
              functionIcon: Icons.arrow_forward_ios,
              onTapFunction: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => SelectCountry()));

              }),
          settingsCon("Language",
              icon: Icons.abc,
              functionIcon: Icons.arrow_forward_ios,
              onTapFunction: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => SelectLanguage()));

              }),
          settingsCon("Currency",
              icon: Icons.attach_money_outlined,
              functionIcon: Icons.arrow_forward_ios,
              onTapFunction: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => SelectCurrency()));

              }),

          //Dark / Light Mode Con
          Container(
            color: white,
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height * 0.02,
                horizontal: MediaQuery.sizeOf(context).height * 0.025),
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height * 0.025),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text(
                  "Dark/Light Mode",
                  style: TextStyle(
                    color: black,
                    fontFamily: "OpenSans_SemiBold",
                    fontSize: MediaQuery.sizeOf(context).height * 0.017,
                  ),
                ),
                Spacer(),
                CupertinoSwitch(
                  value: isDarkMode,
                  onChanged: (bool v) {
                    setState(() {
                      isDarkMode = v!;
                    });
                    // if(isDarkMode)
                    //   {
                    //     setState(() {
                    //       black = Colors.white;
                    //       white = Colors.black.withOpacity(0.8);
                    //     });
                    //   }
                    // if(!isDarkMode){
                    //   setState(() {
                    //     black = Colors.black.withOpacity(0.8);
                    //     white = Colors.white;
                    //   });
                    // }
                  },
                ),
              ],
            ),
          ),

          settingsCon("Terms of Use",
              icon: Icons.perm_device_info,
              functionIcon: Icons.arrow_forward_ios,
              onTapFunction: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => TermsOfUse(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween(begin: Offset(0, 1), end: Offset.zero).animate(animation),
                        child: child,
                      );
                    },
                  ),
                );

              }),
          settingsCon("Terms of Sale",
              icon: Icons.insert_drive_file_outlined,
              functionIcon: Icons.arrow_forward_ios,
              onTapFunction: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => TermsOfSale(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween(begin: Offset(0, 1), end: Offset.zero).animate(animation),
                        child: child,
                      );
                    },
                  ),
                );
              }),
          settingsCon("Privacy Policy",
              icon: Icons.privacy_tip_outlined,
              functionIcon: Icons.arrow_forward_ios,
              onTapFunction: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => PrivacyPolicy(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween(begin: Offset(0, 1), end: Offset.zero).animate(animation),
                        child: child,
                      );
                    },
                  ),
                );
              }),
          settingsCon("About This Version",
              icon: Icons.info_outline,
              functionIcon: Icons.arrow_forward_ios,
              onTapFunction: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => AboutVersion()));

              }),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.025,
          ),
          InkWell(
            onTap: () async {
              bool deleteAccount = await showDeleteAccDialog();
              if (deleteAccount) {
                // Perform delete account action
                // For example: deleteUserAccount();
                CustomSnackBar.show(context, "You will be notified about this action via email with in 48 hours.");
              } else {

              }
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.sizeOf(context).height * 0.02,
                  horizontal: MediaQuery.sizeOf(context).height * 0.025),
              margin: EdgeInsets.only(
                  bottom: MediaQuery.sizeOf(context).height * 0.0025),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.delete,
                    color: secondaryColor,
                    size: MediaQuery.sizeOf(context).height * 0.0275,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).height * 0.025,
                  ),
                  Text(
                    "Delete Account",
                    style: TextStyle(
                      color: secondaryColor,
                      fontFamily: "OpenSans_SemiBold",
                      fontSize: MediaQuery.sizeOf(context).height * 0.017,
                    ),
                  ),
                ],
              ),
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

  Widget settingsCon(String title,
      {IconData? icon, IconData? functionIcon, Function()? onTapFunction}) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.02,
            horizontal: MediaQuery.sizeOf(context).height * 0.025),
        margin:
            EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * 0.0025),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: black.withOpacity(0.7),
              size: MediaQuery.sizeOf(context).height * 0.03,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).height * 0.025,
            ),
            Text(
              title,
              style: TextStyle(
                color: black,
                fontFamily: "OpenSans_SemiBold",
                fontSize: MediaQuery.sizeOf(context).height * 0.017,
              ),
            ),
            Spacer(),
            Icon(
              functionIcon,
              color: black.withOpacity(0.7),
              size: MediaQuery.sizeOf(context).height * 0.025,
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> showDeleteAccDialog() async {
    return (await showDialog(
      barrierColor: black.withOpacity(0.75),
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: white,
        surfaceTintColor: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          'Delete Account',
          style: TextStyle(
            color: secondaryColor,
            fontSize: MediaQuery.sizeOf(context).height * 0.026,
          ),
        ),
        content: Text(
          'Are you sure you want to delete your Lakes America account? This action cannot be undone. All your account data will be permanently deleted.',
          style: TextStyle(
            color: black.withOpacity(0.6),
            fontSize: MediaQuery.sizeOf(context).height * 0.016,
            fontWeight: FontWeight.bold
          ),
        ),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: secondaryColor,
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.2),
                  offset: Offset(0, 0),
                  blurRadius: 1.5,
                )
              ],
            ),
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(true), // Proceeds with account deletion
              child: Text(
                'Delete Account',
                style: TextStyle(
                  color: white,
                  fontSize: MediaQuery.sizeOf(context).height * 0.016,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: white,
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.2),
                  offset: Offset(0, 0),
                  blurRadius: 1.5,
                )
              ],
            ),
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(false), // Cancels account deletion
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: MediaQuery.sizeOf(context).height * 0.016,
                ),
              ),
            ),
          ),
        ],
      ),
    )) ?? false; // If dialog is dismissed by tapping outside, it returns null, which is converted to false
  }
}
