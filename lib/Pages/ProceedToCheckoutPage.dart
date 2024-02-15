import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constants/colors.dart';
import '../Providers/CartProvider.dart';
import '../Routes/PageRoutes.dart';
import 'ForgotPasswordPage.dart';

class ProceedToCheckoutPage extends StatefulWidget {
  const ProceedToCheckoutPage({super.key});

  @override
  State<ProceedToCheckoutPage> createState() => _ProceedToCheckoutPageState();
}

class _ProceedToCheckoutPageState extends State<ProceedToCheckoutPage> {
  bool _isObscured = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var CartProv = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        leadingWidth: MediaQuery.sizeOf(context).height * 0.1,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Center(
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: secondaryColor,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.normal,
                ),
              ),
            )),
        centerTitle: true,
        title: Text(
          "Checkout",
          style: TextStyle(
            fontFamily: "OpenSans_SemiBold",
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height * 0.022,
          ),
        ),
        backgroundColor: white,
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Returning Customer Container
            returningCustomer(_emailController, _passwordController),

            newCustomerCheckout(),

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
                  Text(
                    "Guest checkout",
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).height * 0.016,
                        fontFamily: "OpenSans_SemiBold",
                        fontWeight: FontWeight.bold,
                        color: black.withOpacity(0.7)),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.015,
                  ),
                  Text(
                    "Checkout as a guest and pay with credit card, PayPal or gift card.",
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).height * 0.016,
                        fontFamily: "OpenSans_SemiBold",
                        color: black.withOpacity(0.7)),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
                  InkWell(
                    onTap: () => navigateToCheckoutPage(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).height * 0.02,
                          vertical: MediaQuery.sizeOf(context).height * 0.0125),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: black, width: 1),
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(0, 0),
                              blurRadius: 1.5,
                            )
                          ]),
                      child: Text(
                        "Checkout as guest",
                        style: TextStyle(
                            fontSize: MediaQuery.sizeOf(context).height * 0.018,
                            fontFamily: "OpenSans_SemiBold",
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget returningCustomer(
      TextEditingController emailCon, TextEditingController passCon) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.025),
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).height * 0.025),
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Returning customer",
            style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).height * 0.016,
                fontFamily: "OpenSans_SemiBold",
                fontWeight: FontWeight.bold,
                color: black.withOpacity(0.7)),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.015,
          ),
          Text(
            "Hello, welcome back! Sign in for faster checkout.",
            style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).height * 0.016,
                fontFamily: "OpenSans_SemiBold",
                color: black.withOpacity(0.7)),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
          TextField(
            controller: emailCon,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.018,
                fontFamily: "OpenSans",
                color: Colors.black,
              ),
              // Adjust content padding to control field height
              contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.015,
                  vertical: MediaQuery.of(context).size.height * 0.015),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          TextField(
            controller: passCon,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.018,
                fontFamily: "OpenSans",
                color: Colors.black,
              ),
              // Adjust content padding to control field height
              contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.015,
                  vertical: MediaQuery.of(context).size.height * 0.015),
              suffixIcon: IconButton(
                icon: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                    color: _isObscured
                        ? Colors.black.withOpacity(0.8)
                        : primaryColor),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              ),
              border: OutlineInputBorder(),
            ),
            obscureText: _isObscured,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (_) => ForgotPasswordPage()));
            },
            child: Text(
              'Forgot your password?',
              style: TextStyle(
                  color: black,
                  fontSize: MediaQuery.sizeOf(context).height * 0.016,
                  decoration: TextDecoration.underline),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
          InkWell(
            onTap: () => navigateToCheckoutPage(context),

            child: Container(
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
                "Continue to Checkout",
                style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height * 0.018,
                    fontFamily: "OpenSans_SemiBold",
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget newCustomerCheckout()
  {
    return Container(
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
          Text(
            "New customer checkout",
            style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).height * 0.016,
                fontFamily: "OpenSans_SemiBold",
                fontWeight: FontWeight.bold,
                color: black.withOpacity(0.7)),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.015,
          ),
          Text(
            "Become a member today - it's fast & free!.",
            style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).height * 0.016,
                fontFamily: "OpenSans_SemiBold",
                color: black.withOpacity(0.7)),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
          InkWell(
            onTap: () => navigateToCheckoutPage(context),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).height * 0.02,
                  vertical: MediaQuery.sizeOf(context).height * 0.0125),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: black, width: 1),
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: Offset(0, 0),
                      blurRadius: 1.5,
                    )
                  ]),
              child: Text(
                "Continue as member",
                style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height * 0.018,
                    fontFamily: "OpenSans_SemiBold",
                    fontWeight: FontWeight.bold,
                    color: black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
