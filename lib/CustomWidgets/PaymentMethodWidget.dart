import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
     return Wrap(
      direction: Axis.horizontal,
      children: [

        optionCon(context, "https://www.investopedia.com/thmb/F8CKM3YkF1fmnRCU2g4knuK0eDY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/MClogo-c823e495c5cf455c89ddfb0e17fc7978.jpg"),

        optionCon(context,"https://logowik.com/content/uploads/images/219_visa.jpg"),

        optionCon(context,"https://i.pcmag.com/imagery/reviews/02RJy7OTtPnQQjh37yQDNqx-15.fit_lim.size_1050x591.v1598973550.png"),

        optionCon(context,"https://lh3.googleusercontent.com/lfSN8-0uxLdHSqBD9ULaZUiBRJ_9lCKK8JqHGWhdgy4WjGJNYQtQ5hPbw2RBCBfEABPTqljEVA4J2J3Pr-emxqnIZu16WIt41CE7Mg"),

        optionCon(context,"https://services.youngicee.com/wp-content/uploads/2022/11/Skrill-Payments-in-Nigeria.jpg"),

        optionCon(context,"https://i.pcmag.com/imagery/reviews/068BjcjwBw0snwHIq0KNo5m-15.fit_lim.size_1050x591.v1602794215.png"),

        optionCon(context,"https://media.licdn.com/dms/image/D4D12AQFeJNDLBjbD7g/article-cover_image-shrink_600_2000/0/1699919132616?e=2147483647&v=beta&t=cijOpAhtkqWez8hpfdklWoasLdsLFZ5tRYJ7Z9nfaOM"),

        optionCon(context,"https://goodmoneyguide.com/wp-content/uploads/2021/03/Wise-Money-Transfer-Review.png"),

      ],
    );
  }

  Widget optionCon(BuildContext context,String img)
  {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: black.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.contain
        )
      ),
      margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.015,bottom: MediaQuery.sizeOf(context).height*0.015,right: MediaQuery.sizeOf(context).height*0.015), // Add margin for aesthetics
      height: MediaQuery.sizeOf(context).height*0.05, // Specify height
      width: MediaQuery.sizeOf(context).height*0.07, // Make container take full width
    );
  }
}
