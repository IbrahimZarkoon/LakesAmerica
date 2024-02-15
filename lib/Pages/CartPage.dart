import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/CustomWidgets/CartPageProductsSlider.dart';
import 'package:lakesamerica/CustomWidgets/Headings.dart';
import 'package:lakesamerica/Pages/Dashboard.dart';
import 'package:provider/provider.dart';

import '../Constants/colors.dart';
import '../CustomWidgets/FavPageProductsGridview.dart';
import '../CustomWidgets/OffersPageProductsSlider.dart';
import '../CustomWidgets/PaymentMethodWidget.dart';
import '../Models/Product.dart';
import '../Providers/CartProvider.dart';
import '../Routes/PageRoutes.dart';
import 'ApplyDiscountPage.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  List<Product>? recommendedProducts = [
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F60%2F62%2F60629c6b2c3c690c247a6b1bff2d4541f4155d0c.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      'title': 'Loose Fit Hoodie',
      'category': 'Men Jackets',
      'price': '99',
      'quantity' : 85,
      'discountAmount' : '60%',
      'discountPrice' : '39',
      'newArrival' : true,
    },
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2Fb4%2F26%2Fb4261cae5350fe9209375bf73cf0014104d6e61f.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      'title': 'Cargo joggers',
      'category': 'Men Pants',
      'price': '199','discountAmount' : '20%',
      'quantity' : 85,
      'discountPrice' : '169',
      'newArrival' : false,
    },
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F70%2F90%2F7090859755dd5b6c809c17cee153b092459be037.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      'title': 'Relaxed Fit Sweatpants',
      'category': 'Men Pants',
      'price': '199','discountAmount' : '55%',
      'newArrival' : true,
      'quantity' : 85,
      'discountPrice' : '89',
    },
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F3b%2F02%2F3b02e03e308786099f336ad9df8f27aa34681d1b.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      'title': 'Oversized turtleneck jumper',
      'category': 'Women Jumpers',
      'price': '99',
      'discountAmount' : '30%',
      'newArrival' : false,
      'quantity' : 85,
      'discountPrice' : '69',
    },
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2Ff4%2F00%2Ff4004cd89e5d30466aa9a8f473caa29f32d84d0c.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_cardigansjumpers_cardigans%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      'title': 'Rib-knit cardigan',
      'category': 'Women Knitwear',
      'price': '199','discountAmount' : '30%',
      'newArrival' : true,
      'quantity' : 85,
      'discountPrice' : '69',
    },
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2Fa1%2F70%2Fa170f68ba3610172a5d8ecf6ff9fbabd915e3a6c.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      'title': 'Tapered Regular Jeans',
      'category': 'Women Jeans',
      'price': '99','discountAmount' : '20%',
      'newArrival' : false,
      'quantity' : 85,
      'discountPrice' : '79',
    },

    // Add more products as needed
  ].map((productMap) => Product(
    image: "${productMap['image']!}",
    title: "${productMap['title']!}",
    category: "${productMap['category']!}",
    price: "${productMap['price']!}",
    discountAmount: "${productMap['discountAmount'] ?? "0.0"}",
    discountPrice: "${productMap['discountPrice'] ?? "0.0"}", newArrival: productMap['newArrival'] as bool, quantity: int.parse("${productMap['quantity'] ?? 0}"),
  )).toList();

  void _removeProductAndUpdate() {
    var CartProv = Provider.of<CartProvider>(context,listen: false);
    setState(() {
      CartProv.loadCartFromPrefs();
    });
  }

  @override
  Widget build(BuildContext context) {
    var CartProv = Provider.of<CartProvider>(context,listen: false);

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        leadingWidth: 50,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: black,
              size: MediaQuery.sizeOf(context).height * 0.03,
            )),
        centerTitle: true,
        title: Text(
          "Shopping Bag",
          style: TextStyle(
            fontFamily: "OpenSans_SemiBold",
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height * 0.022,
          ),
        ),
        backgroundColor: black.withOpacity(0.025),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(CartProv.cartItems.length >0? MediaQuery.sizeOf(context).height*0.11 : kToolbarHeight/2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              //Checkout Container
              CartProv.cartItems.length >0? InkWell(
                onTap: () => navigateToProceedToCheckoutPage(context),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).height * 0.02,
                      vertical: MediaQuery.sizeOf(context).height * 0.0125),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: black,width: 1),
                
                      color: black, borderRadius: BorderRadius.circular(5),boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: Offset(0,0),
                      blurRadius: 1.5,
                    )
                  ]),
                  child: Text(
                    "Continue to checkout",
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).height * 0.018,
                        fontFamily: "OpenSans_SemiBold",
                        color: Colors.white),
                  ),
                ),
              ) : SizedBox(),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.015,vertical: MediaQuery.of(context).size.height * 0.015),
                child: Text(
                  "Spend \$50+ on e-gift cards & get 20% back.",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "OpenSans_SemiBold",
                    fontSize: MediaQuery.of(context).size.height * 0.015,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),


      body: RefreshIndicator(
        color: primaryColor,
        backgroundColor: white,
        edgeOffset: 0.5,
        displacement: MediaQuery.sizeOf(context).height*0.2,
        onRefresh: () async {
          CartProv.loadCartFromPrefs();
          setState(() {
          });
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height*0.025),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              CartProv.cartItems.isNotEmpty? cartItemsWidget(context) : noCartProducts(),

              Container(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.01),
                child: Column(
                  children: [
                    Container(
                      padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.0,bottom: MediaQuery.sizeOf(context).height*0.01 , left:MediaQuery.sizeOf(context).height*0.015 , right:MediaQuery.sizeOf(context).height*0.015),
                      child: Row(
                        children:  [

                          Text("You may also like",overflow: TextOverflow.ellipsis,
                              style:
                              TextStyle(color: Colors.black.withOpacity(0.8),fontFamily: "OpenSans_Bold", fontSize: MediaQuery.sizeOf(context).height*0.022,)),
                        ],
                      ),
                    ),

                    OffersPageProductSlider.custom(snapshot: recommendedProducts),

                    Container(
                      padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.015,bottom: MediaQuery.sizeOf(context).height*0.01 , left:MediaQuery.sizeOf(context).height*0.015 , right:MediaQuery.sizeOf(context).height*0.015),
                      child: Row(
                        children:  [

                          Text("Shop with",overflow: TextOverflow.ellipsis,
                              style:
                              TextStyle(color: Colors.black.withOpacity(0.8),fontFamily: "OpenSans_Bold", fontSize: MediaQuery.sizeOf(context).height*0.022,)),
                        ],
                      ),
                    ),

                    OffersPageProductSlider(),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget cartItemsWidget(BuildContext context)
  {
    var CartProv = Provider.of<CartProvider>(context,listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        CartProductsGrid(context, CartProv.cartItems,_removeProductAndUpdate),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
          child: Text("Log in to use your member offers!",
            style: TextStyle(
              color: black,
              fontFamily: "OpenSans_SemiBold",
              fontSize: MediaQuery.sizeOf(context).height*0.015,
            ),),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height*0.005,),

        //Login Container
        InkWell(
          onTap: ()
          {
            navigateToSignInPage(context);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height * 0.02,
                vertical: MediaQuery.sizeOf(context).height * 0.0125),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: black,width: 1),

                color: white, borderRadius: BorderRadius.circular(5),boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: Offset(0,0),
                blurRadius: 1.5,
              )
            ]),
            child: Text(
              "Log in",
              style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).height * 0.018,
                  fontFamily: "OpenSans_Bold",
                  color: black),
            ),
          ),
        ),

        SizedBox(height: MediaQuery.sizeOf(context).height*0.015,),

        Padding(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
            child: shadowLine(context)),

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

        //Order Value
        Container(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
          margin: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.01),
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

        //Shadow Con
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          margin:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),

          decoration:  BoxDecoration(
            color: black,
          ),
        ),

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
            child: shadowLine(context)),

        //We Accept Con
        Container(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
          margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.0125),
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("We accept:",textAlign: TextAlign.start,style: TextStyle(
                  color: black,fontSize: MediaQuery.sizeOf(context).height*0.015,fontFamily: "OpenSans_SemiBold"
              ),),

              PaymentMethodWidget(),
            ],
          ),
        ),


        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Final prices and shipping costs will be confirmed at checkout.",textAlign: TextAlign.start,style: TextStyle(
                  color: black.withOpacity(0.6),fontSize: MediaQuery.sizeOf(context).height*0.0135,fontFamily: "OpenSans_SemiBold"
              ),),

              SizedBox(height: MediaQuery.sizeOf(context).height*0.005,),

              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: TextStyle(color: Colors.black), // Default text style
                  children: <TextSpan>[
                    TextSpan(text: '30-day returns, ',style: TextStyle(
                        color: black.withOpacity(0.6),fontSize: MediaQuery.sizeOf(context).height*0.0135,fontFamily: "OpenSans_SemiBold"
                    ),),
                    TextSpan(text: 'Read more about our ',style: TextStyle(
                        color: black.withOpacity(0.6),fontSize: MediaQuery.sizeOf(context).height*0.0135,fontFamily: "OpenSans_SemiBold"
                    ),),
                    TextSpan(
                      text: 'return and refund policy.',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: black.withOpacity(0.6),fontSize: MediaQuery.sizeOf(context).height*0.0135,fontFamily: "OpenSans_SemiBold"
                      ),

                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle the tap, possibly navigating to a new Widget that explains the policy in detail
                          print('Return and Refund Policy tapped');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: MediaQuery.sizeOf(context).height*0.015,),

        InkWell(
          onTap: ()
          {
            navigateToShippingReturnsPage(context);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025,vertical: MediaQuery.sizeOf(context).height*0.0),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height * 0.02,
                vertical: MediaQuery.sizeOf(context).height * 0.0125),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: black.withOpacity(0.5),width: 1),

                color: white, borderRadius: BorderRadius.circular(5),boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: Offset(0,0),
                blurRadius: 1,
              )
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Icon(CupertinoIcons.cube_box,color: black.withOpacity(0.8),size: MediaQuery.sizeOf(context).height*0.03,),

                SizedBox(width: MediaQuery.sizeOf(context).height*0.015,),

                Text("Shipping & return options",textAlign: TextAlign.start,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: black,fontSize: MediaQuery.sizeOf(context).height*0.015,fontFamily: "OpenSans_SemiBold"
                ),),

                Spacer(),

                Icon(Icons.keyboard_arrow_right,color: black.withOpacity(0.8),size: MediaQuery.sizeOf(context).height*0.03,)

              ],
            ),
          ),
        ),

        SizedBox(height: MediaQuery.sizeOf(context).height*0.025,),
      ],
    );
  }

  Widget noCartProducts() {
    return Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Image.asset('assets/images/ShoppingBagIcon.png',height: MediaQuery.sizeOf(context).height*0.15,fit: BoxFit.cover,),

          SizedBox(height: MediaQuery.sizeOf(context).height*0.05),

          Text(
            'Your shopping bag is empty',
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.022,fontFamily: "OpenSans_Bold"),
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height*0.05),

          Container(
            //padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
            child: Column(
              children: [
                //Sign In Con
                InkWell(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 4)));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.0),
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height * 0.02,
                        vertical: MediaQuery.sizeOf(context).height * 0.0125),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: black,width: 1),

                        color: black, borderRadius: BorderRadius.circular(10),boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        offset: Offset(0,0),
                        blurRadius: 1.5,
                      )
                    ]),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height * 0.018,
                          fontFamily: "OpenSans_SemiBold",
                          color: Colors.white),
                    ),
                  ),
                ),

                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: black.withOpacity(0.05),
                        height: MediaQuery.sizeOf(context).height*0.002,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.01,vertical: MediaQuery.sizeOf(context).height*0.01),
                      child: Text('or'), // The 'or' text in between
                    ),
                    Expanded(
                      child: Container(
                        color: black.withOpacity(0.05),
                        height: MediaQuery.sizeOf(context).height*0.002,
                      ),
                    ),
                  ],
                ),

                //Create acc Container
                Container(
                  margin: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height*0.03),

                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).height * 0.02,
                      vertical: MediaQuery.sizeOf(context).height * 0.0125),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: black,width: 1),
                      color: white, borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          offset: Offset(0,0),
                          blurRadius: 1.5,

                        )
                      ]
                  ),
                  child: Text(
                    "Create a new account",
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).height * 0.018,
                        fontFamily: "OpenSans_SemiBold",
                        color: black),
                  ),
                ),

                //shadow Con
                Container(
                  color: black.withOpacity(0.05),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height*0.002,
                ),

                //We Accept Con
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.0125),
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("We accept:",textAlign: TextAlign.start,style: TextStyle(
                          color: black,fontSize: MediaQuery.sizeOf(context).height*0.015,fontFamily: "OpenSans_SemiBold"
                      ),),

                      PaymentMethodWidget(),

                      Text("Final prices and shipping costs will be confirmed at checkout.",textAlign: TextAlign.start,style: TextStyle(
                          color: black.withOpacity(0.6),fontSize: MediaQuery.sizeOf(context).height*0.0135,fontFamily: "OpenSans_SemiBold"
                      ),),

                      SizedBox(height: MediaQuery.sizeOf(context).height*0.005,),

                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black), // Default text style
                          children: <TextSpan>[
                            TextSpan(text: '30-day returns, ',style: TextStyle(
                                color: black.withOpacity(0.6),fontSize: MediaQuery.sizeOf(context).height*0.0135,fontFamily: "OpenSans_SemiBold"
                            ),),
                            TextSpan(text: 'Read more about our ',style: TextStyle(
                                color: black.withOpacity(0.6),fontSize: MediaQuery.sizeOf(context).height*0.0135,fontFamily: "OpenSans_SemiBold"
                            ),),
                            TextSpan(
                              text: 'return and refund policy.',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: black.withOpacity(0.6),fontSize: MediaQuery.sizeOf(context).height*0.0135,fontFamily: "OpenSans_SemiBold"
                              ),

                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle the tap, possibly navigating to a new Widget that explains the policy in detail
                                  print('Return and Refund Policy tapped');
                                },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      )
    );
  }
}
