import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/Pages/ForgotPasswordPage.dart';

import '../Constants/colors.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/Logo.png'), // Replace with your logo asset path
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Text(
                'Sign In',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.03,fontFamily: "OpenSans_Bold"),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.01),
              Text(
                'Become a Member - you\'ll enjoy exclusive deals, offers, invites and rewards.',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily: "OpenSans_SemiBold"),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.06),

              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                    fontFamily: "OpenSans",
                    color: Colors.black,
                  ),
                  // Adjust content padding to control field height
                  contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.015,vertical: MediaQuery.of(context).size.height * 0.015),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.03),

              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                    fontFamily: "OpenSans",
                    color: Colors.black,
                  ),
                  // Adjust content padding to control field height
                  contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.015,vertical: MediaQuery.of(context).size.height * 0.015),
                  suffixIcon: IconButton(
                    icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off, color:_isObscured? Colors.black.withOpacity(0.8) : primaryColor),
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

              SizedBox(height: MediaQuery.sizeOf(context).height*0.03),

              InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => ForgotPasswordPage()));
                },
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(color: black,fontSize: MediaQuery.sizeOf(context).height*0.016,decoration: TextDecoration.underline),
                ),
              ),


              Container(
                margin: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.03),
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
                  "Become a member",
                  style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height * 0.018,
                      fontFamily: "OpenSans_SemiBold",
                      color: black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}