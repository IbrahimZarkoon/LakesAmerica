import 'package:flutter/material.dart';
import 'package:lakesamerica/Pages/Dashboard.dart';

import '../Constants/colors.dart';
import '../Routes/PageRoutes.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            fontFamily: "OpenSans_Bold",
            fontSize: MediaQuery.of(context).size.height * 0.022,
          ),
        ),
        backgroundColor: black.withOpacity(0.025),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight/2),
          child: Padding(
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
        ),
      ),


      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Your shopping bag is empty',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.022,fontFamily: "OpenSans_Bold"),
              ),
        
              SizedBox(height: MediaQuery.sizeOf(context).height*0.03),

              InkWell(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 4)));
                },
                child: Container(
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
              SizedBox(height: MediaQuery.sizeOf(context).height*0.03),

              Container(
                color: black.withOpacity(0.05),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height*0.002,
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height*0.03),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("We accept")

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
