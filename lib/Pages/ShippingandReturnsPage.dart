import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class ShippingPage extends StatelessWidget {
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
          "Shipping & return options",
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
              'Shipping & Returns',textAlign: TextAlign.center,
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
                    text: 'At Lakes America, we strive to provide fast and reliable shipping to all our customers. Here\'s what you need to know about our shipping policy:\n',
                    style: TextStyle(
                      fontFamily: "OpenSans_SemiBold",
                      fontSize: MediaQuery.sizeOf(context).height*0.022,
                      color: black,
                    ),
                  ),
                ],
              ),
            ),

            contentCon(context, "Processing Time", "Orders are typically processed and shipped within 1-2 business days after payment confirmation."),
            contentCon(context, "Shipping Methods", "We offer various shipping methods, including standard and expedited shipping, to accommodate your needs."),
            contentCon(context, "Shipping Rates", "Shipping rates are calculated based on the shipping method selected and the destination of the order. You can view the shipping cost at checkout before completing your purchase."),
            contentCon(context, "Delivery Time", "Delivery times may vary depending on the shipping method chosen and the destination. Standard shipping typically takes 3-7 business days, while expedited shipping may arrive sooner."),
            contentCon(context, "Tracking", "Once your order has shipped, you will receive a tracking number via email, allowing you to track your package's journey from our warehouse to your doorstep."),
            contentCon(context, "International Shipping", "We currently offer shipping within the United States. For international orders, please contact our customer support team for assistance."),
            contentCon(context, "For any questions or concerns", "For any questions or concerns regarding shipping, feel free to reach out to our customer support team. Your satisfaction is our top priority."),


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