import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = true; // Add this line

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () { // Change to 2 or 3 seconds as needed
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        leadingWidth: 50,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: black,
              size: MediaQuery.sizeOf(context).height * 0.0325,
            )),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryColor,))  : SingleChildScrollView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/images/Logo.png'), // Replace with your logo asset path
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),

            Text(
              'Forgot password?',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.03,fontFamily: "OpenSans_Bold"),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.01),
            Text(
              'Please enter the email address you used to create your account, and we\'ll send you a link to reset your password.',
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


            SizedBox(height: MediaQuery.sizeOf(context).height*0.03),

            Container(
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
                "Submit",
                style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height * 0.018,
                    fontFamily: "OpenSans_SemiBold",
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
