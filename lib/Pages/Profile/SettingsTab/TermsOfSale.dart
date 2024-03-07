import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';

class TermsOfSale extends StatefulWidget {
  const TermsOfSale({super.key});

  @override
  State<TermsOfSale> createState() => _TermsOfSaleState();
}

class _TermsOfSaleState extends State<TermsOfSale> {
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
          "Terms of Sale Policy",
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
              'Terms of Sale',textAlign: TextAlign.center,
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
                    text: 'Thank you for shopping with Lakes America. Please read these terms carefully before making a purchase.\n\n',
                    style: TextStyle(
                      fontFamily: "OpenSans_SemiBold",
                      fontSize: MediaQuery.sizeOf(context).height*0.022,
                      color: black,
                    ),
                  ),
                ],
              ),
            ),
            contentCon(context, "Product Availability", "All products are subject to availability. We reserve the right to discontinue any product at any time."),
            contentCon(context, "Order Confirmation", "Once you have placed an order, you will receive an email confirmation with your order details. Please review this confirmation carefully and contact us immediately if there are any errors or discrepancies."),
            contentCon(context, "Price and Payment", "All prices are listed in US dollars and are subject to change without notice. Payment is required at the time of purchase. We accept major credit cards and PayPal."),
            contentCon(context, "Shipping", "Shipping costs and delivery estimates will be provided at the time of checkout. Please review our Shipping Policy for more information."),
            contentCon(context, "Returns and Exchanges", "We accept returns and exchanges within 30 days of purchase. Please review our Return Policy for detailed instructions."),
            contentCon(context, "Warranty", "We offer a limited warranty on select products. Please review the warranty information provided with your product for details."),
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
