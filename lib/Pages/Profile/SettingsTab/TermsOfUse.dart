import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';

class TermsOfUse extends StatefulWidget {
  const TermsOfUse({super.key});

  @override
  State<TermsOfUse> createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        leadingWidth: 0,
        centerTitle: true,
        title: Text(
          "Terms of Use Policy",
          style: TextStyle(
            fontFamily: "OpenSans_Bold",
            color: black,
            fontSize: MediaQuery.of(context).size.height * 0.022,
          ),
        ),
        backgroundColor: black.withOpacity(0.025),
        actions: [

          InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.close,
                color: black.withOpacity(0.5),
                size: MediaQuery.sizeOf(context).height * 0.03,
              )),

          SizedBox(width: MediaQuery.sizeOf(context).height*0.025,),

        ],

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025,vertical: MediaQuery.sizeOf(context).height*0.025),
        child: Column(
          children: [
            Text(
              'Terms of Use',textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).height*0.025,
                fontFamily: "OpenSans_Bold",
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.025),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'By using our website and services, you agree to comply with and be bound by the following terms and conditions. Please read them carefully.\n\n',
                    style: TextStyle(
                      fontFamily: "OpenSans_SemiBold",
                      fontSize: MediaQuery.sizeOf(context).height*0.022,
                      color: black,
                    ),
                  ),
                ],
              ),
            ),
        contentCon(context, "Use of Website", "The content of the pages of this website is for your general information and use only. It is subject to change without notice."),
        contentCon(context, "Intellectual Property", "This website contains material which is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance, and graphics. Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions."),
        contentCon(context, "User Accounts", "If you create an account on our website, you are responsible for maintaining the confidentiality of your account and password and for restricting access to your computer, and you agree to accept responsibility for all activities that occur under your account or password."),
        contentCon(context, "Limitation of Liability", "We shall not be liable for any loss or damage arising out of or in connection with your use of this website. This includes, without limitation, direct loss, loss of business or profits (whether or not the loss of such profits was foreseeable, arose in the normal course of things or you have advised this Company of the possibility of such potential loss), damage caused to your computer, computer software, systems and programs and the data thereon or any other direct or indirect, consequential and incidental damages."),
        contentCon(context, "Changes to Terms", "We reserve the right to modify these terms at any time. You should check this page periodically for changes. Your continued use of the site after we post any modifications indicates that you accept the modifications."),
          ],
        ),
      ),


    );
  }


  Widget contentCon(BuildContext context,String title,String content)
  {
    return Column(
      children: [
        Text(
          title,textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.sizeOf(context).height*0.025,
            fontFamily: "OpenSans_Bold",
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height*0.025),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: '$content\n',
                style: TextStyle(
                  fontFamily: "OpenSans_SemiBold",
                  fontSize: MediaQuery.sizeOf(context).height*0.018,
                  color: black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
