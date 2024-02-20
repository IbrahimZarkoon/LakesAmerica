import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/Pages/ApplyDiscountPage.dart';
import 'package:lakesamerica/Pages/CheckOutDetails/BillingAddressTab.dart';
import 'package:lakesamerica/Pages/CheckOutDetails/MyInfo.dart';
import 'package:provider/provider.dart';

import '../Constants/colors.dart';
import '../CustomWidgets/Headings.dart';
import '../Providers/CartProvider.dart';
import '../Providers/CheckoutProvider.dart';
import '../Routes/PageRoutes.dart';
import 'CheckOutDetails/ShippingTab.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // Assuming two tabs for demonstration
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String appBarTitle = "Checkout";

  @override
  Widget build(BuildContext context) {
    var CartProv = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        leadingWidth: MediaQuery.sizeOf(context).height * 0.06,
        leading: InkWell(
            onTap: (){
              if(appBarTitle == "Checkout") {
                Navigator.pop(context);
              }else{
                _tabController.animateTo(0);
                setState(() {
                  appBarTitle = "Checkout";
                });
              }
            },
            child: Icon(
              Icons.arrow_back,
              color: black,
              size: MediaQuery.sizeOf(context).height * 0.03,
            )),
        centerTitle: true,
        title: Text(
          appBarTitle,
          style: TextStyle(
            fontFamily: "OpenSans_SemiBold",
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height * 0.022,
          ),
        ),
        backgroundColor: white,
      ),

      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          CheckoutTab(),
          MyInformationTab(tabController: _tabController),
          BillingAddressTab(tabController: _tabController),
          ShippingTab(tabController: _tabController)
        ],
      ),

    );
  }

  Widget CheckoutTab()
  {
    var CartProv = Provider.of<CartProvider>(context, listen: false);
    var CheckoutProv = Provider.of<CheckoutProvider>(context, listen: false);

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          //My Information Container
          Container(
            width: MediaQuery.sizeOf(context).width,
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height * 0.025),
            padding:
            EdgeInsets.all(MediaQuery.sizeOf(context).height * 0.025),
            color: white,
            child: CheckoutProv.myInformation.firstName.isEmpty?
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Information",
                  style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height * 0.02,
                      fontFamily: "OpenSans_SemiBold",
                      fontWeight: FontWeight.bold,
                      color: black),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.015,
                ),
                InkWell(
                  onTap: ()
                  {
                    _tabController.animateTo(1);
                    setState(() {
                      appBarTitle = "My Information";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height * 0.02,
                        vertical: MediaQuery.sizeOf(context).height * 0.0125),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 1),
                        color: black,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: Offset(0, 0),
                            blurRadius: 1.5,
                          )
                        ]),
                    child: Text(
                      "Select",
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height * 0.018,
                          fontFamily: "OpenSans_SemiBold",
                          color: white),
                    ),
                  ),
                ),
              ],
            )
                :
            InkWell(
              onTap: ()
              {
                _tabController.animateTo(1);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Information",
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.02,
                              fontFamily: "OpenSans_SemiBold",
                              fontWeight: FontWeight.bold,
                              color: black),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.005,
                        ),

                        Text(
                          "${CheckoutProv.myInformation.firstName} ${CheckoutProv.myInformation.lastName}",
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.016,
                              fontFamily: "OpenSans_SemiBold",
                              color: black),
                        ),
                        Text(
                          CheckoutProv.myInformation.email,
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.016,
                              fontFamily: "OpenSans_SemiBold",
                              color: black),
                        ),

                      ],
                    ),
                  ),

                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),

          //Billing Address Container
          Container(
            width: MediaQuery.sizeOf(context).width,
            margin: EdgeInsets.only(
                bottom: MediaQuery.sizeOf(context).height * 0.025),
            padding:
            EdgeInsets.all(MediaQuery.sizeOf(context).height * 0.025),
            color: white,
            child: CheckoutProv.billingAddress.address.isEmpty?
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Billing Address",
                  style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height * 0.02,
                      fontFamily: "OpenSans_SemiBold",
                      fontWeight: FontWeight.bold,
                      color: black),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.015,
                ),
                InkWell(
                  onTap: ()
                  {
                    _tabController.animateTo(2);
                    setState(() {
                      appBarTitle = "Billing Address";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height * 0.02,
                        vertical: MediaQuery.sizeOf(context).height * 0.0125),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 1),
                        color: black,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: Offset(0, 0),
                            blurRadius: 1.5,
                          )
                        ]),
                    child: Text(
                      "Select",
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height * 0.018,
                          fontFamily: "OpenSans_SemiBold",
                          color: white),
                    ),
                  ),
                ),
              ],
            )
                :
            InkWell(
              onTap: ()
              {
                _tabController.animateTo(2);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Billing Address",
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.02,
                              fontFamily: "OpenSans_SemiBold",
                              fontWeight: FontWeight.bold,
                              color: black),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.005,
                        ),

                        Text(
                          "${CheckoutProv.myInformation.firstName} ${CheckoutProv.myInformation.lastName}",
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.016,
                              fontFamily: "OpenSans_SemiBold",
                              color: black),
                        ),
                        Text(
                          CheckoutProv.billingAddress.address,
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.016,
                              fontFamily: "OpenSans_SemiBold",
                              color: black),
                        ),
                        Text(
                          CheckoutProv.billingAddress.company,
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.016,
                              fontFamily: "OpenSans_SemiBold",
                              color: black),
                        ),
                        Text(
                          CheckoutProv.billingAddress.addressLine2,
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.016,
                              fontFamily: "OpenSans_SemiBold",
                              color: black),
                        ),
                        Text(
                          CheckoutProv.billingAddress.city,
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.016,
                              fontFamily: "OpenSans_SemiBold",
                              color: black),
                        ),
                        Text(
                          CheckoutProv.billingAddress.postalCode,
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.016,
                              fontFamily: "OpenSans_SemiBold",
                              color: black),
                        ),
                        Text(
                          CheckoutProv.billingAddress.state,
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.016,
                              fontFamily: "OpenSans_SemiBold",
                              color: black),
                        ),

                      ],
                    ),
                  ),

                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),

          //Shipping Container
          Container(
            width: MediaQuery.sizeOf(context).width,
            margin: EdgeInsets.only(
                bottom: MediaQuery.sizeOf(context).height * 0.025),
            padding:
            EdgeInsets.all(MediaQuery.sizeOf(context).height * 0.025),
            color: white,
            child: CheckoutProv.shipping.shippingTitle.isEmpty?
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shipping",
                  style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height * 0.02,
                      fontFamily: "OpenSans_SemiBold",
                      fontWeight: FontWeight.bold,
                      color: black),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.015,
                ),
                InkWell(
                  onTap: ()
                  {
                    _tabController.animateTo(3);
                    setState(() {
                      appBarTitle = "Shipping";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height * 0.02,
                        vertical: MediaQuery.sizeOf(context).height * 0.0125),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 1),
                        color: black,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: Offset(0, 0),
                            blurRadius: 1.5,
                          )
                        ]),
                    child: Text(
                      "Select",
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height * 0.018,
                          fontFamily: "OpenSans_SemiBold",
                          color: white),
                    ),
                  ),
                ),
              ],
            )
                :
            InkWell(
              onTap: ()
              {
                _tabController.animateTo(3);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shipping",
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.02,
                              fontFamily: "OpenSans_SemiBold",
                              fontWeight: FontWeight.bold,
                              color: black),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.005,
                        ),

                        Text(
                          "${CheckoutProv.shipping.shippingTitle}",
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.016,
                              fontFamily: "OpenSans_SemiBold",
                              color: black),
                        ),
                        Text(
                          "${CheckoutProv.shipping.shippingDays} delivery",
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.016,
                              fontFamily: "OpenSans_SemiBold",
                              color: black),
                        ),
                        Text(
                          "${CheckoutProv.shipping.shippingPrice}",
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.016,
                              fontFamily: "OpenSans_SemiBold",
                              color: black),
                        ),


                      ],
                    ),
                  ),

                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),

          Container(
            width: MediaQuery.sizeOf(context).width,
            margin: EdgeInsets.only(
                bottom: MediaQuery.sizeOf(context).height * 0.025),
            padding:
            EdgeInsets.all(MediaQuery.sizeOf(context).height * 0.025),
            color: white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Icon(CupertinoIcons.cube_box,size: MediaQuery.sizeOf(context).height*0.03,color: black.withOpacity(0.8),),

                    SizedBox(width: MediaQuery.sizeOf(context).height*0.01,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Package",
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.017,
                              fontFamily: "OpenSans_SemiBold",
                              fontWeight: FontWeight.bold,
                              color: black),
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height*0.005,),

                        Text(
                          "${CartProv.cartItems.length} items",
                          style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.014,
                              fontFamily: "OpenSans_SemiBold",
                              color: black.withOpacity(0.6)),
                        ),
                      ],
                    ),

                    Spacer(),

                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Shipped by: ',
                            style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.016,),

                          ),
                          TextSpan(
                            text: 'Lakes America',
                            style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.016,fontWeight: FontWeight.bold),

                          ),

                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.015,
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.15,

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: CartProv.cartItems.length ?? 0,
                    itemBuilder: (BuildContext context,index)
                    {
                      return Container(
                        margin: EdgeInsets.only(right: MediaQuery.sizeOf(context).height*0.015),
                        width: MediaQuery.sizeOf(context).width*0.225,
                        height: MediaQuery.sizeOf(context).height*0.1,
                        decoration: BoxDecoration(

                          image: DecorationImage(
                            image: NetworkImage(
                              "${CartProv.cartItems[index].image}"
                            ),
                            fit: BoxFit.cover
                          )
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height*0.015,),

          //Details Container
          DetailsCon(),

          //Shipping & Returns Con
          shippingReturnsCon(),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(CupertinoIcons.lock,color: black.withOpacity(0.6),size: MediaQuery.sizeOf(context).height*0.025,),

              SizedBox(width: MediaQuery.sizeOf(context).height*0.005,),
              Text("All data will be encrypted.",style: TextStyle(
                color: black.withOpacity(0.6),
                fontFamily: "OpenSans",fontWeight: FontWeight.bold,
                fontSize: MediaQuery.sizeOf(context).height*0.016
              ),),
            ],
          ),

          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.025,
          ),
        ],
      ),
    );
  }

  Widget shippingReturnsCon()
  {
    return InkWell(
      onTap: ()
      {
        navigateToShippingReturnsPage(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height*0.015),
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).height * 0.02,
            vertical: MediaQuery.sizeOf(context).height * 0.0125),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Icon(CupertinoIcons.cube_box,color: black.withOpacity(0.8),size: MediaQuery.sizeOf(context).height*0.03,),

            SizedBox(width: MediaQuery.sizeOf(context).height*0.015,),

            Text("Shipping & return options",textAlign: TextAlign.start,style: TextStyle(
                fontWeight: FontWeight.bold,
                color: black,fontSize: MediaQuery.sizeOf(context).height*0.016,fontFamily: "OpenSans_SemiBold"
            ),),

            Spacer(),

            Icon(Icons.keyboard_arrow_right,color: black.withOpacity(0.8),size: MediaQuery.sizeOf(context).height*0.03,)

          ],
        ),
      ),
    );
  }

  Widget DetailsCon()
  {
    var CheckoutProv = Provider.of<CheckoutProvider>(context, listen: false);
    var CartProv = Provider.of<CartProvider>(context, listen: false);

    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height*0.025),
      decoration: BoxDecoration(
        color: white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //Discount Details
          Container(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
            margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Discounts',
                  style: TextStyle(
                      color: black.withOpacity(0.6),
                      fontSize: MediaQuery.sizeOf(context).height*0.016,
                      fontFamily: "OpenSans_SemiBold"
                  ),),
                InkWell(
                  onTap: ()
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ApplyDiscountPage()), // Replace ApplyDiscountPage with your actual page class
                    ).then((_) {
                      // This block will be executed after you pop back from ApplyDiscountPage
                      setState(() {
                        // Any state updates you want to perform. This could be refreshing data,
                        // updating the UI, or anything else that needs to happen after returning.
                      });
                    });
                  },
                  child: Text('${CartProv.discountAmount > 0? CartProv.discountAmount : "Apply Discount"}',
                    style: TextStyle(
                        color: black,
                        fontSize: MediaQuery.sizeOf(context).height*0.016,
                        fontFamily: "OpenSans_SemiBold",
                        decoration: TextDecoration.underline
                    ),),
                ),
              ],
            ),
          ),

          Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025,vertical: MediaQuery.sizeOf(context).height*0.015),
              child: shadowLine(context)),

          //Order Value
          Container(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
            margin: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height*0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order value',
                  style: TextStyle(
                      color: black.withOpacity(0.6),
                      fontSize: MediaQuery.sizeOf(context).height*0.016,
                      fontFamily: "OpenSans_SemiBold"
                  ),),
                Text('\$${CartProv.calculateOrderAmount()}',
                  style: TextStyle(
                    color: black,
                    fontSize: MediaQuery.sizeOf(context).height*0.016,
                    fontFamily: "OpenSans_SemiBold",
                  ),),
              ],
            ),
          ),

          //Shipping Value
          Container(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
            margin: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height*0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping',
                  style: TextStyle(
                      color: black.withOpacity(0.6),
                      fontSize: MediaQuery.sizeOf(context).height*0.016,
                      fontFamily: "OpenSans_SemiBold"
                  ),),
                Text('\$${CartProv.shippingAmount}',
                  style: TextStyle(
                    color: black,
                    fontSize: MediaQuery.sizeOf(context).height*0.016,
                    fontFamily: "OpenSans_SemiBold",
                  ),),
              ],
            ),
          ),

          //Taxes Value
          Container(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
            margin: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height*0.015),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Taxes',
                  style: TextStyle(
                      color: black.withOpacity(0.6),
                      fontSize: MediaQuery.sizeOf(context).height*0.016,
                      fontFamily: "OpenSans_SemiBold"
                  ),),
                Text('\$${CartProv.taxesAmount}',
                  style: TextStyle(
                    color: black,
                    fontSize: MediaQuery.sizeOf(context).height*0.016,
                    fontFamily: "OpenSans_SemiBold",
                  ),),
              ],
            ),
          ),

          Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
              child: shadowLine(context)),

          //Total Value
          Container(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
            margin: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.015),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',
                  style: TextStyle(
                      color: black,
                      fontSize: MediaQuery.sizeOf(context).height*0.02,
                      fontFamily: "OpenSans_Bold"
                  ),),
                Text('\$${CartProv.calculateTotalAmount()}',
                  style: TextStyle(
                    color: black,
                    fontSize: MediaQuery.sizeOf(context).height*0.02,
                    fontFamily: "OpenSans_Bold",
                  ),),
              ],
            ),
          ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: TextStyle(color: Colors.black), // Default text style
                children: <TextSpan>[
                  TextSpan(text: 'By continuing, you agree to ',style: TextStyle(
                      color: black.withOpacity(0.6),fontSize: MediaQuery.sizeOf(context).height*0.0135,fontFamily: "OpenSans_SemiBold"
                  ),),
                  TextSpan(
                    text: 'LakesAmerica\'s General Terms and Conditions.\n\n',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: black.withOpacity(0.6),fontSize: MediaQuery.sizeOf(context).height*0.0135,fontFamily: "OpenSans_SemiBold"
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle the tap, possibly navigating to a new Widget that explains the policy in detail
                        print('General Terms and Conditions. tapped');
                      },
                  ),

                  TextSpan(text: 'We will process your personal data in accordance with Lakes America\'s  ',style: TextStyle(
                      color: black.withOpacity(0.6),fontSize: MediaQuery.sizeOf(context).height*0.0135,fontFamily: "OpenSans_SemiBold"
                  ),),
                  TextSpan(
                    text: 'Privacy Notice.\n',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: black.withOpacity(0.6),fontSize: MediaQuery.sizeOf(context).height*0.0135,fontFamily: "OpenSans_SemiBold"
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle the tap, possibly navigating to a new Widget that explains the policy in detail
                        print('Privacy Notice. tapped');
                      },
                  ),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: ()
            {

            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).height * 0.02,
                  vertical: MediaQuery.sizeOf(context).height * 0.0125),
              alignment: Alignment.center,
              decoration: BoxDecoration(

                  color: (CheckoutProv.myInformation.email.isEmpty && CheckoutProv.shipping.shippingTitle.isEmpty && CheckoutProv.billingAddress.address.isEmpty )?
                  black.withOpacity(0.2) : primaryColor, borderRadius: BorderRadius.circular(5),
                ),
              child: Text(
                "Checkout",
                style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height * 0.018,
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans_SemiBold",
                    color: (CheckoutProv.myInformation.email.isEmpty && CheckoutProv.shipping.shippingTitle.isEmpty && CheckoutProv.billingAddress.address.isEmpty )? black.withOpacity(0.5) : white),
              ),
            ),
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height*0.025,),

          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Customer Service",
                  style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height * 0.017,
                      fontFamily: "OpenSans_SemiBold",
                      fontWeight: FontWeight.bold,
                      color: black),
                ),

                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black), // Default text style
                    children: <TextSpan>[
                      TextSpan(text: '\nNeed help? Please contact ',style: TextStyle(
                          color: black.withOpacity(0.6),fontSize: MediaQuery.sizeOf(context).height*0.0135,fontFamily: "OpenSans_SemiBold"
                      ),),
                      TextSpan(
                        text: 'Customer Service.\n',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: black.withOpacity(0.6),fontSize: MediaQuery.sizeOf(context).height*0.0135,fontFamily: "OpenSans_SemiBold"
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle the tap, possibly navigating to a new Widget that explains the policy in detail
                            print('General Terms and Conditions. tapped');
                          },
                      ),

                      TextSpan(text: 'For quick help, chat with us!',style: TextStyle(
                          color: black.withOpacity(0.6),fontSize: MediaQuery.sizeOf(context).height*0.0135,fontFamily: "OpenSans_SemiBold"
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.025,
          ),

        ],
      ),
    );
  }
}
