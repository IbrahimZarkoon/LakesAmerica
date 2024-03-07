import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
          "Privacy Policy",
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
              'Privacy Policy',textAlign: TextAlign.center,
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
                    text: 'At Lakes America, we are committed to protecting your privacy. This Privacy Policy outlines how we collect, use, disclose, and safeguard your personal information.\n\n',
                    style: TextStyle(
                      fontFamily: "OpenSans_SemiBold",
                      fontSize: MediaQuery.sizeOf(context).height*0.022,
                      color: black,
                    ),
                  ),
                ],
              ),
            ),
            contentCon(context, "Information We Collect", "We may collect personal information such as your name, email address, shipping address, and payment details when you place an order or create an account on our website."),
            contentCon(context, "How We Use Your Information", "We may use your personal information to process your orders, communicate with you, provide customer support, and improve our products and services."),
            contentCon(context, "Information Sharing", "We may share your personal information with third-party service providers to facilitate services such as shipping, payment processing, and marketing. We will not sell, rent, or lease your personal information to third parties."),
            contentCon(context, "Data Security", "We implement security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction."),
            contentCon(context, "Your Choices", "You may update, correct, or delete your personal information by accessing your account settings on our website. You may also opt out of receiving marketing communications from us."),
            contentCon(context, "Children's Privacy", "Our website is not directed to individuals under the age of 13, and we do not knowingly collect personal information from children."),
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
