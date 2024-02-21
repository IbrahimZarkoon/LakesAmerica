import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/CustomWidgets/CustomSnackBar.dart';
import 'package:lakesamerica/CustomWidgets/Headings.dart';
import 'package:lakesamerica/Models/CheckoutModels/PaymentMethodModel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Constants/colors.dart';
import '../../Models/CheckoutModels/MyInfoModel.dart';
import '../../Providers/CheckoutProvider.dart';

class PaymentTab extends StatefulWidget {
  PaymentTab({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<PaymentTab> createState() => _PaymentTabState();
}

class _PaymentTabState extends State<PaymentTab> {
  final TextEditingController _cardNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cardCVCController = TextEditingController();

  bool _isLoading = false;
  int _groupValue = -1;

  @override
  void dispose() {
    super.dispose();
    _cardNameController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cardCVCController.dispose();
    super.dispose();
  }

  Future<void> saveDetails() async {
    setState(() => _isLoading = true);
    await Future.delayed(Duration(milliseconds: 1000));
    widget.tabController.animateTo(0);
    setState(() => _isLoading = false);
  }



  @override
  Widget build(BuildContext context) {
    var CheckoutProv = Provider.of<CheckoutProvider>(context, listen: false);

    List<Map<String, dynamic>> paymentOptions = [
      {
        'title': 'Credit/Debit Card',
        'value': 0,
        'imagePath':
        'https://www.investopedia.com/thmb/F8CKM3YkF1fmnRCU2g4knuK0eDY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/MClogo-c823e495c5cf455c89ddfb0e17fc7978.jpg',
        'paymentWidget': cardPayment(), // Your Credit/Debit Card payment widget
      },
      {
        'title': 'PayPal',
        'value': 1,
        'imagePath':
        'https://i.pcmag.com/imagery/reviews/068BjcjwBw0snwHIq0KNo5m-15.fit_lim.size_1050x591.v1602794215.png',
        'paymentWidget': paypalPayment(), // Your PayPal payment widget
      },
      // Add more payment options if needed
    ];

    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).height * 0.025,right: MediaQuery.sizeOf(context).height * 0.025),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
        ListView.builder(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.25),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: paymentOptions.length,
      itemBuilder: (context, index) {
        return _buildPaymentOption(
          title: paymentOptions[index]['title'],
          value: paymentOptions[index]['value'],
          imagePath: paymentOptions[index]['imagePath'],
          paymentWidget: paymentOptions[index]['paymentWidget'],
        );
      },
    ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () async {
              CheckoutProv.paymentMethod = PaymentMethodModel(title: "${paymentOptions[_groupValue]['title']}", details: []);
              await saveDetails();
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).height * 0.025),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).height * 0.02,
                  vertical: MediaQuery.sizeOf(context).height * 0.0125),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: black, width: 1),
                  color: black,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: Offset(0, 0),
                      blurRadius: 1.5,
                    )
                  ]),
              child: Text(
                "Save",
                style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height * 0.018,
                    fontFamily: "OpenSans_SemiBold",
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.025,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.lock,
                color: black.withOpacity(0.6),
                size: MediaQuery.sizeOf(context).height * 0.025,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).height * 0.005,
              ),
              Text(
                "All data will be encrypted.",
                style: TextStyle(
                    color: black.withOpacity(0.6),
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.sizeOf(context).height * 0.016),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.025,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({
    required String title,
    required int value,
    required String imagePath,
    required Widget paymentWidget,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ExpansionTile(
          shape: InputBorder.none,
          childrenPadding: EdgeInsets.all(0),
          tilePadding: EdgeInsets.all(0),
          onExpansionChanged: (bool expanded) {
            if (expanded) {
              setState(() {
                _groupValue = value;
              });
            }
          },
          leading: Radio<int>(
            value: value,
            groupValue: _groupValue,
            activeColor: primaryColor,
            onChanged: (int? newValue) {
              if (newValue != null) {
                setState(() {
                  _groupValue = newValue;
                });
              }
            },
          ),
          title: Text(
            title,
            style: TextStyle(
              color: black,
              fontFamily: "OpenSans_SemiBold",
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.sizeOf(context).height * 0.017,
            ),
          ),
          trailing: Container(
            decoration: BoxDecoration(
                border: Border.all(color: black.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: NetworkImage(imagePath), fit: BoxFit.contain)),
            margin: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.015,
                bottom: MediaQuery.sizeOf(context).height * 0.015,
                right: MediaQuery.sizeOf(context).height *
                    0.015), // Add margin for aesthetics
            height: MediaQuery.sizeOf(context).height * 0.05, // Specify height
            width: MediaQuery.sizeOf(context).width *
                0.125, // Make container take full width
          ),
          children: <Widget>[
            paymentWidget,
          ],
        ),
        shadowLine(context),
      ],
    );
  }

  Widget cardPayment() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: white,
          ),
          child: TextField(
            controller: _cardNameController,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.016,
              fontFamily: "OpenSans_SemiBold",
              color: black,
            ),
            decoration: InputDecoration(
              labelText: 'Name on card *',
              labelStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.016,
                fontFamily: "OpenSans",
                color: black,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.015,
              ),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            cursorColor: primaryColor,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: white,
          ),
          child: TextField(
            controller: _cardNumberController,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.016,
              fontFamily: "OpenSans_SemiBold",
              color: black,
            ),
            cursorColor: primaryColor,
            decoration: InputDecoration(
              labelText: 'Card number*',
              labelStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.016,
                fontFamily: "OpenSans",
                color: black,
              ),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.015,
                  vertical: MediaQuery.of(context).size.height * 0),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white,
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.016,
                    fontFamily: "OpenSans_SemiBold",
                    color: black,
                  ),
                  controller: _expiryDateController,
                  decoration: InputDecoration(
                    labelText: 'Expiry Date*',
                    labelStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                      fontFamily: "OpenSans",
                      color: black,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.015,
                        vertical: MediaQuery.of(context).size.height * 0.0),
                    border: OutlineInputBorder(),
                  ),
                  cursorColor: primaryColor,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.height * 0.025),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white,
                ),
                child: TextField(style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.016,
                  fontFamily: "OpenSans_SemiBold",
                  color: black,
                ),
                  controller: _cardCVCController,
                  decoration: InputDecoration(
                    labelText: 'CVC/CVV*',
                    labelStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                      fontFamily: "OpenSans",
                      color: black,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.015,
                        ),
                    border: OutlineInputBorder(),
                  ),
                  cursorColor: primaryColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
      ],
    );
  }

  Widget paypalPayment() {
    // Your PayPal payment widget implementation
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        Container(
          decoration: BoxDecoration(
              border: Border.all(color: black.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: AssetImage("assets/images/PaypalPay.jpeg"), fit: BoxFit.cover)),
          margin: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height*0.025),
          height: MediaQuery.sizeOf(context).height * 0.5, // Specify height
          width: MediaQuery.sizeOf(context).width, // Make container take full width
        ),

        Text("or pay using the link below",
          style: TextStyle(
              color: black.withOpacity(0.6),
              fontSize: MediaQuery.sizeOf(context).height*0.016,
              fontFamily: "OpenSans_SemiBold"
          ),),

        InkWell(
            onTap: ()
            async{
              try
                  {
                    await launchUrl(Uri.parse("https://www.paypal.me/sofsupply?locale.x=en_CA"));

                  }
                  catch (e)
              {
                print(e);
                CustomSnackBar.show(context, "Error launching PayPal.");
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.025),
              child: Text("https://www.paypal.me/sofsupply?locale.x=en_CA",style: TextStyle(
                color: Color(0xff0548b0),
                fontSize: MediaQuery.sizeOf(context).height*0.016,
                fontFamily: "OpenSans_SemiBold"
              ),),
            ),)
      ]
    );
  }

  Widget skrillPayment() {
    // Your Skrill payment widget implementation
    return Container(
      padding: EdgeInsets.all(16),
      child: Text('Skrill Payment Details'),
    );
  }
}
